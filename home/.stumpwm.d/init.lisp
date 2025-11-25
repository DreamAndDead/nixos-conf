;; -*-lisp-*-
(in-package :stumpwm)

(set-prefix-key (kbd "M-SPC"))

;; TODO
;;; bind key to start v2ray, librewolf
;;; how to use dynamic group
;;; how to use float group
;;; unbinding useless key
;;; custom keymap?
;;;; window group
;;;; frame group


;; multi monitors
;;; arandr gui, set layout
;;; autorandr cli, save layout
;;; autorandr cli, load layout when wm start
(run-shell-command "autorandr -l stumpwm-layout")

;; load wm layout
;;; commmand: dump-group-to-file hero
;(restore-from-file "hero")

(run-shell-command "xsetroot -cursor_name left_ptr")
(run-shell-command "xset r rate 200 60")

;; live coding
(ql:quickload "slynk")
(defcommand slynk (port) ((:string "Port number: "))
  (sb-thread:make-thread
   (lambda ()
     (slynk:create-server :port (parse-integer port) :dont-close t))
   :name "slynk-stumpwm"))

;; key bindings
(define-key *root-map* (kbd "t") "exec xfce4-terminal")

;; 1 Default
;; 2
(gnewbg-dynamic "Dynamic")
;; 3
(gnewbg-float "Float")


(set-normal-gravity :top)
(setf *message-window-gravity* :bottom-right)
(setf *input-window-gravity* :center)
(setf *mouse-focus-policy* :sloppy)
(setf *window-border-style* :tight)


;; TODO ttf font later
(set-font "-*-*-medium-r-normal-*-*-*-*-*-*-*-*-*")


(setf *startup-message* nil)
(setf *window-format* "%m%n%s%c")
(setf *time-modeline-string* "%F %H:%M")
(setf *group-format* "%t")
(setf *mode-line-timeout* 1)
(setf *screen-mode-line-format* (list "[^B%n^b] %W^>%d"))
(setf *mode-line-position* :bottom)
(dolist (h (screen-heads (current-screen)))
  (enable-mode-line (current-screen) h t))



; window placement rules
(clear-window-placement-rules)





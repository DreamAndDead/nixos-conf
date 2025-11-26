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

;; x setting
(run-shell-command "xsetroot -cursor_name left_ptr")
(run-shell-command "xset r rate 200 60")

;; multi monitors
;;; arandr gui, set layout
;;; autorandr cli, save layout
;;; autorandr cli, load layout when wm start
(run-shell-command "autorandr -l stumpwm-layout")

;; load wm layout
;;; commmand: dump-group-to-file hero
(restore-from-file "hero")

;; commands
;;; live coding
(defcommand slynk (port) ((:string "Port number: "))
  (sb-thread:make-thread
   (lambda ()
     (slynk:create-server :port (parse-integer port) :dont-close t))
   :name "slynk-stumpwm"))

;;; launch web browser
(defcommand launch-web-browser () ()
  (run-shell-command "flatpak run io.gitlab.librewolf-community"))

;;; launch vial
(defcommand launch-vial () ()
  (run-shell-command "~/Downloads/Vial-v0.7.5-x86_64.AppImage"))

;;; launch v2rayn
(defcommand launch-v2ray () ()
  (run-shell-command "~/Downloads/v2rayN-linux-64.AppImage"))


;; key bindings
;;; clean first
(undefine-key *root-map* (kbd "c"))
(undefine-key *root-map* (kbd "C-c"))
(undefine-key *root-map* (kbd "C-e"))
(undefine-key *root-map* (kbd "C-b"))
(undefine-key *root-map* (kbd "C-a"))
(undefine-key *root-map* (kbd "C-m"))
(undefine-key *root-map* (kbd "C-w"))
(undefine-key *root-map* (kbd "C-l"))
(undefine-key *root-map* (kbd "C-k"))
(undefine-key *root-map* (kbd "C-0"))
(undefine-key *root-map* (kbd "C-1"))
(undefine-key *root-map* (kbd "C-2"))
(undefine-key *root-map* (kbd "C-3"))
(undefine-key *root-map* (kbd "C-4"))
(undefine-key *root-map* (kbd "C-5"))
(undefine-key *root-map* (kbd "C-6"))
(undefine-key *root-map* (kbd "C-7"))
(undefine-key *root-map* (kbd "C-8"))
(undefine-key *root-map* (kbd "C-9"))
(undefine-key *root-map* (kbd "F1"))
(undefine-key *root-map* (kbd "F2"))
(undefine-key *root-map* (kbd "F3"))
(undefine-key *root-map* (kbd "F4"))
(undefine-key *root-map* (kbd "F5"))
(undefine-key *root-map* (kbd "F6"))
(undefine-key *root-map* (kbd "F7"))
(undefine-key *root-map* (kbd "F8"))
(undefine-key *root-map* (kbd "F9"))
(undefine-key *root-map* (kbd "F10"))
(undefine-key *root-map* (kbd "F11"))
(undefine-key *root-map* (kbd "a"))
(undefine-key *root-map* (kbd "s"))
(undefine-key *root-map* (kbd "S"))
;;;; quit-confirm is dangerous
(undefine-key *root-map* (kbd "q"))

;;; custom
(define-key *root-map* (kbd "H") '*help-map*)
(define-key *root-map* (kbd "G") '*groups-map*)
(define-key *root-map* (kbd "v") "vsplit")
(define-key *root-map* (kbd "h") "hsplit")
(define-key *root-map* (kbd "s") "windowlist")
(define-key *root-map* (kbd "S") "pull-from-windowlist")
(define-key *root-map* (kbd "g") "gselect")
(define-key *root-map* (kbd "d") "time")


(define-key *root-map* (kbd "t") "exec xfce4-terminal")


;; font
(load-module "ttf-fonts")
(push "~/.local/share/fonts/" xft:*font-dirs*)
;; do this only once
;; (xft:cache-fonts)
(set-font (make-instance 'xft:font :family "Maple Mono NF CN" :subfamily "Regular" :size 10))


;; multi group
;;; 1 Default
;;; 2
(gnewbg-dynamic "Dynamic")
;;; 3
(gnewbg-float "Float")



(set-normal-gravity :top)
(setf *message-window-gravity* :center)
(setf *input-window-gravity* :center)
(setf *mouse-focus-policy* :sloppy)
(setf *window-border-style* :tight)
(setf *startup-message* "StumpWM launched!")
(setf *window-format* "%m%n%s%c")
(setf *time-modeline-string* "%F %H:%M")
(setf *group-format* "%t")


;; modeline
(setf *mode-line-timeout* 1)
(setf *screen-mode-line-format* (list "[^B%n^b] %W^>%d"))
(setf *mode-line-position* :bottom)
;; (dolist (h (screen-heads (current-screen)))
  ;; (enable-mode-line (current-screen) h t))


;; window placement rules
;;; clear first
(clear-window-placement-rules)





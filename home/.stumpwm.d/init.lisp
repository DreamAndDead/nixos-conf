#-quicklisp
(let ((quicklisp-init (merge-pathnames ".roswell/lisp/quicklisp/setup.lisp"
				       (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

;; -*-lisp-*-
(in-package :stumpwm)

(set-prefix-key (kbd "M-SPC"))

(run-shell-command "autorandr -c stumpwm-layout")
(run-shell-command "xsetroot -cursor_name left_ptr")

(ql:quickload "slynk")
(defcommand slynk (port) ((:string "Port number: "))
  (sb-thread:make-thread
   (lambda ()
     (slynk:create-server :port (parse-integer port) :dont-close t))
   :name "slynk-stumpwm"))


(define-key *root-map* (kbd "t") "exec alacritty")

;; 1 default
;; 2
(gnewbg-dynamic "dynamic")
;; 3
(gnewbg-float "float")

(set-normal-gravity :top)
(setf *message-window-gravity* :bottom-right)
(setf *input-window-gravity* :center)
(setf *mouse-focus-policy* :sloppy)
(setf *window-border-style* :tight)




(ql:quickload "clx-truetype")
(load-module "ttf-fonts")
;; (xft:cache-fonts) ;; do this only once
(set-font (make-instance 'xft:font :family "DejaVu Sans Mono" :subfamily "Book" :size 11))


(setf *startup-message* nil)
(setf *window-format* "%m%n%s%c")
(setf *time-modeline-string* "%F %H:%M")
(setf *group-format* "%t")
(setf *mode-line-timeout* 1)
(setf *screen-mode-line-format* (list "[^B%n^b] %W^>%d"))
(setf *mode-line-position* :bottom)
(dolist (h (screen-heads (current-screen)))
  (enable-mode-line (current-screen) h t))


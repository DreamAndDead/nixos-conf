;; -*-lisp-*-
(in-package :stumpwm)

(set-prefix-key (kbd "M-SPC"))

;; TODO
;;; how to use dynamic group
;;; how to use float group

;; multi monitors
;;; arandr gui, set layout
;;; autorandr cli, save layout
;;; autorandr cli, load layout when wm start
(run-shell-command "autorandr -l stumpwm")

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

(defcommand launch-webbrowser() ()
  (run-or-raise "librewolf" '(:class "librewolf")))

(defcommand launch-vial () ()
  (run-or-raise "~/Downloads/Apps/Vial-v0.7.5-x86_64.AppImage" '(:class "Vial")))

(defcommand launch-proxy () ()
  (run-or-raise "~/Downloads/Apps/v2rayN-linux-64.AppImage" '(:class "v2rayN")))

(defcommand launch-terminal () ()
  (run-or-raise "wezterm-gui" '(:class "org.wezfurlong.wezterm")))

;;; launch emacs
(defcommand launch-emacs () ()
  (run-or-raise "emacsclient -c -n" '(:class "Emacs")))

;; key bindings
;;; clean first
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
(undefine-key *root-map* (kbd "c"))
(undefine-key *root-map* (kbd "v"))
(undefine-key *root-map* (kbd "h"))
(undefine-key *root-map* (kbd "Q"))
;;;; quit-confirm is dangerous
(undefine-key *root-map* (kbd "q"))

;;; custom
;;;; Emacs Style Frame Splitting
(define-key *root-map* (kbd "0") "remove")
(define-key *root-map* (kbd "1") "only")
(define-key *root-map* (kbd "2") "vsplit")
(define-key *root-map* (kbd "3") "hsplit")

(define-key *root-map* (kbd "H") '*help-map*)
(define-key *root-map* (kbd "G") '*groups-map*)
(define-key *root-map* (kbd "s") "windowlist")
(define-key *root-map* (kbd "S") "pull-from-windowlist")
(define-key *root-map* (kbd "g") "gselect")
(define-key *root-map* (kbd "d") "time")

(define-key *root-map* (kbd "e") "launch-emacs")
(define-key *root-map* (kbd "E") "emacs")
(define-key *root-map* (kbd "t") "launch-terminal")
(define-key *root-map* (kbd "w") "launch-webbrowser")


;; remap keys
(defparameter *default-remap-keys*
  '(("C-n"   . "Down")
    ("C-p"   . "Up")
    ("M-v" . "SunPageUp")
    ("C-v" . "SunPageDown")

    ("C-g" . "ESC")
    ("C-b" . "Left")
    ("C-f" . "Right")
    ("M-b" . "C-Left")
    ("M-f" . "C-Right")
    ("C-a" . "Home")
    ("C-e" . "End")
    ("C-d" . "Delete")
    ("C-k" . ("S-End" "C-c" "DEL"))
    ;; ("C-w" . "C-x")
    ;; ("M-w" . "C-c")
    ;; ("C-y" . "C-v")
    ("C-s" . "C-f"))
  "The default keys for remapping. Remember, DEL is backspace, Delete is Delete") 

(define-remapped-keys
    `(("Brave-browser"
       ,@*default-remap-keys*
       )))

;; modules
(load-module "beckon")
(define-key *root-map* (kbd "B") "beckon")


;; font
(load-module "ttf-fonts")
(push "~/.local/share/fonts/" xft:*font-dirs*)
;; do this only once
(xft:cache-fonts)
(set-font (make-instance 'xft:font :family "IosevkaTerm NF" :subfamily "Regular" :size 14))


;; color
(defvar phundrak-nord0 "#2e3440")
(defvar phundrak-nord1 "#3b4252")
(defvar phundrak-nord2 "#434c5e")
(defvar phundrak-nord3 "#4c566a")
(defvar phundrak-nord4 "#d8dee9")
(defvar phundrak-nord5 "#e5e9f0")
(defvar phundrak-nord6 "#eceff4")
(defvar phundrak-nord7 "#8fbcbb")
(defvar phundrak-nord8 "#88c0d0")
(defvar phundrak-nord9 "#81a1c1")
(defvar phundrak-nord10 "#5e81ac")
(defvar phundrak-nord11 "#bf616a")
(defvar phundrak-nord12 "#d08770")
(defvar phundrak-nord13 "#ebcb8b")
(defvar phundrak-nord14 "#a3be8c")
(defvar phundrak-nord15 "#b48ead")

(setq *colors*
      `(,phundrak-nord1   ;; 0 black
        ,phundrak-nord11  ;; 1 red
        ,phundrak-nord14  ;; 2 green
        ,phundrak-nord13  ;; 3 yellow
        ,phundrak-nord10  ;; 4 blue
        ,phundrak-nord14  ;; 5 magenta
        ,phundrak-nord8   ;; 6 cyan
        ,phundrak-nord5)) ;; 7 white

(update-color-map (current-screen))


(set-border-color        phundrak-nord1)
(set-focus-color         phundrak-nord1)
(set-unfocus-color       phundrak-nord3)
(set-float-focus-color   phundrak-nord1)
(set-float-unfocus-color phundrak-nord3)

(set-fg-color phundrak-nord4)
(set-bg-color phundrak-nord1)

(setf *normal-border-width*       0
      *float-window-border*       0
      *float-window-title-height* 15
      *window-border-style*       :none
      *window-format*             "%m%n%s%c %80t")

(setf *input-window-gravity*     :center
      *message-window-padding*   10
      *message-window-y-padding* 10
      *message-window-gravity*   :top
      *message-window-input-gravity*   :top)


;; multi group
;;; 1 Default
;;; 2
(gnewbg-dynamic "Dynamic")
;;; 3
(gnewbg-float "Float")


(set-normal-gravity :top)
(setf *mouse-focus-policy* :sloppy)

(setf *startup-message* "StumpWM launched!")
(setf *time-modeline-string* "%F/%H:%M")
(setf *group-format* "%n%s%t")


;; modeline
(setf *mode-line-timeout* 1)
(setf *screen-mode-line-format* (list "[^B%n^b] %W^>%d"))
(setf *mode-line-position* :bottom)
;; (dolist (h (screen-heads (current-screen)))
  ;; (enable-mode-line (current-screen) h t))


;; window placement rules
;;; clear first
(clear-window-placement-rules)





;;; -*- lexical-binding: t -*-

;; nix os 

;; interface
(menu-bar-mode 1)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(blink-cursor-mode 0)
(setq-default cursor-type 'bar)
(setq inhibit-startup-screen nil)
(setq-default indent-tabs-mode nil)
(setq show-paren-delay 0)
(show-paren-mode)
(setq visible-bell t)
(setq tab-always-indent 'complete)
(setq scroll-conservatively 10
      scroll-margin 20)

;; m-x
(use-package which-key)
(which-key-mode t)

(use-package repeat
  :custom
  (repeat-mode +1))


;; save and backup files
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 2
      kept-old-versions 2
      version-control t)

(add-function :after after-focus-change-function (lambda () (save-some-buffers t)))


;; key bindings
(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)

(global-set-key (kbd "C-z") #'undo)
(global-set-key (kbd "M-z") #'undo-redo)



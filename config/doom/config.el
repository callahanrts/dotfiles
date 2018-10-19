;;; ~/.config/doom/config.el -*- lexical-binding: t; -*-

;; (if (featurep! +bindings) (load! "+bindings"))
(load! "+bindings")


;; Fancy titlebar for MacOS (Not used in emacs-plus --no-titlebar)
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))


;; 100 Char indicator
;(require 'column-marker)

(require 'fill-column-indicator)
(setq fci-rule-width 2)
(setq fci-rule-column 100)
(setq fci-rule-color "#191B20")
(define-globalized-minor-mode global-fci-mode fci-mode
(lambda ()
    (if (and
        (not (string-match "^\*.*\*$" (buffer-name)))
        (not (eq major-mode 'dired-mode)))
        (fci-mode 1))))
(global-fci-mode 1)


;; Disable evil-snipe (it interferes with 's' - evil-substitute)
(evil-snipe-mode 0)
(evil-snipe-override-mode 0)

;; Default tab width at 2
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default js2-basic-offset 2)

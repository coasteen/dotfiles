(require 'package)
(setq package-archives
      '(("gnu"   . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; basic niceness
(setq inhibit-startup-message t
      initial-scratch-message "")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; clipboard support (X11)
(setq x-select-enable-clipboard t)
(setq interprogram-cut-function
      (lambda (text &optional push)
        (let ((process-connection-type nil))
          (let ((proc (start-process "xclip" "*Messages*" "xclip" "-selection" "clipboard")))
            (process-send-string proc text)
            (process-send-eof proc)))))
(setq interprogram-paste-function
      (lambda ()
        (shell-command-to-string "xclip -o -selection clipboard")))

;; language support
(use-package rust-mode)
(use-package lua-mode)
(use-package shfmt) ; shell formatter
(use-package flycheck
  :init (global-flycheck-mode))
(use-package company
  :init (global-company-mode))

;; helpful extras
(use-package which-key
  :init (which-key-mode))

;;;;; EMACS BULLSHIT CONFIGS

;; tab bar (optional GUI-style tabs)
;; (tab-bar-mode 1) ; uncomment this if u want tabs!
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; other things i added without researching a lot

;; line numbers + relative line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; theme (modus vivendi)
(load-theme 'modus-vivendi t)

;; zooming

(add-to-list 'default-frame-alist '(font . "Monospace-13"))


;; doom-modeline
(use-package doom-modeline
  :init (doom-modeline-mode 1))

;; projectile
(use-package projectile
  :init (projectile-mode 1))

;; quality of life

;; remember where u save files
(save-place-mode 1)
;; recent files list
(recentf-mode 1)
;; winnermode: undo/redo window layouts
(winner-mode 1)
;; backup + auto-save nuke
(setq make-backup-files nil)
(setq auto-save-default nil)
;; Dired File Manager
(setq dired-listing-switches "-alh")
(put 'dired-find-alternate-file 'disabled nil)

;; vterm
(use-package vterm)
;; neotree
(use-package neotree)

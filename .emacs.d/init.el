;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Package Repos
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Backup file to a directory, directory ignored under .gitignore
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

;; Disable audio bell
(setq visible-bell 1)

;; Hide title, tool, and scroll bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Line numbers
(global-linum-mode t)
;; Spacing between linenumber and text
(setq linum-format "%d ")

;; Disable startup messages
(setq inhibit-startup-message t
inhibit-startup-echo-area-message t)

;; Basically enabling fuzzy searching
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" default)))
 '(package-selected-packages (quote (flycheck color-theme-sanityinc-tomorrow js2-mode))))
(custom-set-faces)


;; Ensure packages get installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)


;; Flycheck - Syntax Linting
(use-package flycheck
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode))


;; JavScript
(use-package js2-mode
  :mode ("\\.js\\'" . js2-mode)
  :config
  (progn
    (add-hook 'js2-mode-hook
	      (lambda ()
		(setq js2-basic-offset 2)
		(setq js2-basic-indent 2)
		(setq js2-auto-indent-p t)))))

(use-package color-theme-sanityinc-tomorrow
  :init
  (load-theme 'sanityinc-tomorrow-blue :no-confirm))

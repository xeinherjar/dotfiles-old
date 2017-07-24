(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Backup file to a directory, directory ignored under .gitignore
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

;; Disable audio bell
(setq visible-bell 1)

;; Line numbers
(global-linum-mode t)
;; Spacing between linenumber and text
(setq linum-format "%d ")

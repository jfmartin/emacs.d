;; Begin initialization
;; Turn off mouse interface early in startup to avoid momentary display
(when window-system
  (menu-bar-mode 1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(add-to-list 'load-path (concat user-emacs-directory "elisp"))

;; Set up package
(require 'package)
;; (add-to-list 'package-archives
;;	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives
;;	     '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives
;;	     '("org" . "http://orgmode.org/elpa/"))

(package-initialize)

;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

;; Basic conf

;; Personnal information
;; Configuration from elisp files
(require 'mycoreconf)
(require 'extrapackconf)
(require 'orgconfig)
(require 'myfunctions)
(require 'myprogcommon)
;(require 'lang-elisp)
;(require 'lang-rust)
;(require 'lang-go)


;; TO CLEAN UP

;; ispell
(defun my/set-aspell ()
  "Set aspell as the ispell program."
  (if (executable-find "aspell")
      (progn
	(setq ispell-program-name "aspell")
	(setq ispell-extra-args '("--sug-mode=ultra")))
    ;; Fallback to ispell
    (setq ispell-program-name "ispell")))

(defun my/set-hunspell ()
  "Set hunspell as the ispell program."
  (if (executable-find "hunspell")
      (setq ispell-program-name "hunspell")
    ;; Fallback to aspell
    (my/set-aspell)))

(my/set-hunspell)

;; (add-hook 'text-mode-hook 'flyspell-mode)
;; (add-hook 'org-mode-hook 'flyspell-mode)
;; (add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; eshell
;; (setq eshell-prompt-function
;;       (lambda nil
;;      (concat
;;       (propertize (eshell/pwd) 'face `(:foreground "blue"))
;;       "\n "
;;       (propertize "$ " 'face `(:foreground "green")))))
;; (setq eshell-highlight-prompt nil)

(setq eshell-prompt-function
      (lambda nil
	(concat
	 (eshell/pwd)
	 "\n $ ")))


;; ediff cli
;; Usage: emacs -diff file1 file2
(defun command-line-diff (switch)
  (let ((file1 (pop command-line-args-left))
	(file2 (pop command-line-args-left)))
    (ediff file1 file2)))
(add-to-list 'command-switch-alist '("diff" . command-line-diff))

;; (setq tab-always-indent 'complete)

(add-hook 'before-save-hook 'whitespace-cleanup)
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'makefile-mode-hook 'indent-tabs-mode)

;; I can i like the blinking cursor :/
;; (blink-cursor-mode 1)

(defun sudo ()
  "Use TRAMP to `sudo' the current buffer"
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:"
	     buffer-file-name))))

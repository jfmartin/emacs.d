;;; Basic conf

;; Personal informations
(setq user-full-name "Jean-François Martin"
      user-mail-address "jf.je.martin@gmail.com")

;; Custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; ????

;; Answering just 'y' or 'n'
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF-8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Thing that should be activate
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;; Backups & auto-save
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Turn off the blinking cursor
;; (blink-cursor-mode -1)

;; Don't beep
(setq visible-bell t)

;; Hippie > Dabbrev
(global-set-key [remap dabbrev-expand] 'hippie-expand) ; M-/

;; Linenumber
(global-linum-mode 0)

;; Pairs
(show-paren-mode 1)

;; Windows & Frames
(global-set-key (kbd "M-o") 'other-window)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; highlight line
(global-hl-line-mode)

;; column in mode line
(column-number-mode 1)

;; Don't ask when create buffer or file
(setq confirm-nonexistent-file-or-buffer nil)

;; Enable / No warnings
(put 'erase-buffer 'disabled nil)

;; View mode if file is read only
(setq view-read-only t)

;;; Configuration for builtins

;; Buffer
(use-package ibuffer
  :bind
  ("C-x C-b" . ibuffer))

;; Search
(global-set-key (kbd "C-s") 'isearch-forward-regexp) ; was isearch-forward
(global-set-key (kbd "C-r") 'isearch-backward-regexp) ; was isearch-backward

;; Uniquify
(use-package uniquify
  :config (setq uniquify-buffer-name-style 'forward))

;; abbrev
(use-package abbrev
  :init (setq-default abbrev-mode t)
  :config (setq save-abbrevs 'silently)
  :diminish abbrev-mode)

;; ido
(use-package ido
  :init
  (progn
    (ido-mode 1)
    (ido-everywhere 1)
    (use-package ido-vertical-mode
      :ensure t
      :init (ido-vertical-mode 1)
      (setq ido-vertical-define-keys 'C-n-and-C-p-only))
    (use-package flx-ido
      :ensure t
      :init
      (flx-ido-mode 1)
      (setq ido-enable-flex-matching t)))
  :bind (("C-x C-f" . ido-find-file)))

;; recentf
(use-package recentf
  :init
  (progn
    (recentf-mode t)
    (setq recentf-max-saved-items 200
	  recentf-save-file "~/.emacs.d/recentf")))

;; smex
;; (require 'smex)
;; (setq smex-save-file "~/.emacs.d/smex.save")
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; (global-set-key (kbd "C-c M-x") 'smex-update)
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(provide 'mycoreconf)

(use-package helm-dash
  :ensure t
  :commands helm-dash
  :config (setq helm-dash-docsets-path "~/.emacs.d/docsets/"))

(use-package company
  :ensure t
  :diminish company-mode
  :defer 2
  :init
  (setq company-idle-delay 0.3)
  :config
  (global-company-mode))

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :defer 3
  ;; :init(setq yas-snippet-dirs
  ;;    '("~/.emacs.d/snippets")) ;(expand-file-name "custom.el" user-emacs-directory)
  :config (yas-global-mode))

(use-package helm-c-yasnippet
  :ensure t
  :bind ("C-c y" . helm-yas-complete))


(use-package magit
  :ensure t
  :defer t
  ;; :config (define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
  :bind ("C-c g" . magit-status))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config (projectile-global-mode))

(use-package ibuffer-vc
  :ensure t
  :init (add-hook 'ibuffer-hook
		  (lambda ()
		    (ibuffer-vc-set-filter-groups-by-vc-root)
		    (unless (eq ibuffer-sorting-mode 'alphabetic)
		      (ibuffer-do-sort-by-alphabetic)))))

(use-package expand-region
  :ensure t
  :bind ("C-=" . er/expand-region))

(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook
	  (lambda ()
	    (interactive)
	    (setq show-trailing-whitespace 1)))

;;(use-package flycheck)

;; Web stuff
(use-package emmet-mode
  :init (progn
	  (add-hook 'sgml-mode-hook 'emmet-mode)
	  (add-hook 'css-mode-hook 'emmet-mode)))

(provide 'myprogcommon)

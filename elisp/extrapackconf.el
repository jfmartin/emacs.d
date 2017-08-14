;;; Configuration for extras packages and modes

;; Theme

;; (use-package ample-zen-theme
;;   :ensure t
;;   :config (load-theme 'ample-zen t))

;; (use-package yoshi-theme
;;   :ensure t
;;   :config (load-theme 'yoshi t))

(use-package material-theme
  :ensure t
  :config (load-theme 'material t))


;; Helm
(use-package helm
  :init (progn
	  (setq helm-M-x-fuzzy-match t)
	  ;; (global-unset-key (kbd "C-x c"))
	  )
  :bind (("C-c h" . helm-command-prefix)
	 ("C-x b" . helm-mini)
	 ("C-`" . helm-resume)
	 ("M-x" . helm-M-x)
	 ;; ("C-x C-f" . helm-for-files)
	 ;; ("C-x C-f" . helm-find-files)
	 )
  :diminish helm-mode
  :config
  (require 'helm-config)
  (helm-mode))


;; Edit

(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (global-undo-tree-mode))

(use-package whole-line-or-region
  :ensure t)

;; Misc
(use-package neotree
  :bind ([f8] . neotree-toggle))

;(use-package tldr)

;(use-package hydra)

;(use-package key-chord)

;(use-package minimap)

(use-package avy
  :ensure t
  :bind ("C-c C-SPC" . avy-goto-char))

(use-package speed-type
  :defer t
  :ensure t)

;; C-x / ENGINE_KEY
(use-package engine-mode
  :ensure t
  :config
  (defengine duckduckgo
    "https://duckduckgo.com/?q=%s"
    :keybinding "d")
  (defengine github
    "https://github.com/search?ref=simplesearch&q=%s"
    :keybinding "g"))

;; (use-package markdown-mode
;;   :mode (("\\.markdown\\'" . markdown-mode)
;;	 ("\\.md\\'"       . markdown-mode))
;;   :config
;;   (defhydra hydr-markdown (:hint nil)
;;     "
;;   Formatting        C-c C-s    _s_: bold          _e_: italic     _b_: blockquote   _p_: pre-formatted    _c_: code

;;   Headings          C-c C-t    _h_: automatic     _1_: h1         _2_: h2           _3_: h3               _4_: h4

;;   Lists             C-c C-x    _m_: insert item

;;   Demote/Promote    C-c C-x    _l_: promote       _r_: demote     _u_: move up      _d_: move down

;;   Links, footnotes  C-c C-a    _L_: link          _U_: uri        _F_: footnote     _W_: wiki-link      _R_: reference

;;   "

;;     ("s" markdown-insert-bold)
;;     ("e" markdown-insert-italic)
;;     ("b" markdown-insert-blockquote :color blue)
;;     ("p" markdown-insert-pre :color blue)
;;     ("c" markdown-insert-code)

;;     ("h" markdown-insert-header-dwim)
;;     ("1" markdown-insert-header-atx-1)
;;     ("2" markdown-insert-header-atx-2)
;;     ("3" markdown-insert-header-atx-3)
;;     ("4" markdown-insert-header-atx-4)

;;     ("m" markdown-insert-list-item)

;;     ("l" markdown-promote)
;;     ("r" markdown-demote)
;;     ("d" markdown-move-down)
;;     ("u" markdown-move-up)

;;     ("L" markdown-insert-link :color blue)
;;     ("U" markdown-insert-uri :color blue)
;;     ("F" markdown-insert-footnote :color blue)
;;     ("W" markdown-insert-wiki-link :color blue)
;;     ("R" markdown-insert-reference-link-dwim :color blue)
;;     )

;;   (key-chord-mode 1)
;;   (key-chord-define markdown-mode-map "mm" 'hydr-markdown/body)

;;   )

(provide 'extrapackconf)

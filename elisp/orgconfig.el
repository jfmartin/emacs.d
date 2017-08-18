(use-package org
  :bind
  ("C-c l" . org-store-link)
  ("C-c c" . org-capture)
  ("C-c a" . org-agenda)
  :config
  (setq org-default-notes-file "~/org/default.org")
  (setq org-agenda-files (file-expand-wildcards "~/org/agenda/*.org"))
  ;; (setq org-ellipsis "⤵")
  (setq org-src-fontify-natively t)
  (setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "DONE(d@)")))
  (setq org-capture-templates
	'(("j" "Journal Entry"
	   entry (file+datetree "~/org/journal.org")
	   "* %?"
	   :empty-lines 1)
	  ("t" "Todo capture"
	   entry (file "~/org/agenda/todo-capture.org")
	   "* TODO %?"
	   :empty-lines 1)
	  ("n" "Note"
	   entry (file "~/org/notes/capture.org")
	   "* %?"
	   :empty-lines 1)
	  ("s" "Code snippet"
	   entry (file "~/org/notes/programming/snippet_capture.org")
	   (file "~/.emacs.d/snippet.orgcaptmpl")
	   :empty-lines 1))))

;; Exports
;; (require 'ox-md)
;; (require 'ox-odt)

(use-package org-bullets
  :ensure t
  :init (add-hook 'org-mode-hook 'org-bullets-mode))

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (emacs-lisp . t)
   (sh . t)
   (python . t)
   ))

;;Empty line before headline but not plain-list
(setq org-blank-before-new-entry
	'((heading .t) (plain-list-item . nil)))

(provide 'orgconfig)

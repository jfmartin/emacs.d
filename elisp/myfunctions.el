(defun my/insert-file-path (filename &optional args)
  "Insert path of file FILENAME into buffer after point.

  Prefixed with \\[universal-argument], expand the file name to its
  fully canocalized path. See `expand-file-name'.

  Prefixed with \\[negative-argument], use relative path to file
  name from current directory, `default-directory'. See
  `file-relative-name'.

  The default with no prefix is to insert the file name exactly as
  it appears in the minibuffer prompt."

  (interactive "*fInsert file name: \nP")
  (cond ((eq '- args)
	 (insert (file-relative-name filename)))
	((not (null args))
	 (insert (expand-file-name filename)))
	(t
	 (insert filename))))

(defun my/save-kill-buffer ()
  "Save and kill current buffer"
  (interactive)
  (save-buffer)
  (kill-buffer))

(defun my/gotoline ()
  "Toggle linum during goto-line"
  (interactive)
  (progn
    (linum-mode)
    (goto-line (string-to-int (read-from-minibuffer "Line: ")) (current-buffer))
    (linum-mode -1)))
(global-set-key (kbd "M-g M-g") 'my/gotoline)


(defun my/exec-on-current (cmd)
  "Run a command on the current file"
  (interactive "sEnter command: ")
  (shell-command
   (format "%s %s"
	   cmd
	   (shell-quote-argument (buffer-file-name)))))

(provide 'myfunctions)
;;; base ends here

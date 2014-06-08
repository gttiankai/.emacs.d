(provide 'sudo)
(defun sudo-reopen ( ) 
  "reopen current file with sudo."
;  (setq username (replace-regexp-in-string "\n" "" (shell-command-to-string "whoami")))
  (setq sudo-file-real-path
	(replace-regexp-in-string "\n" ""
				  (shell-command-to-string (concat "readlink -f " buffer-file-truename))
				  )
	)
  (kill-this-buffer)
  (find-file (concat "/sudo::" sudo-file-real-path))
  (interactive) 
  )
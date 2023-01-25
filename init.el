(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(straight-use-package
 `(org :type git
	       :repo "https://git.savannah.gnu.org/git/emacs/org-mode.git"
	       :local-repo nil))
(straight-use-package 
  '(yaml-mode
		      :type git
		      :repo "yoshiki/yaml-mode"
		      )
  )
(straight-use-package 'ruby-mode)

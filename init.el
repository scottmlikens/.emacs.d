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
(straight-use-package 'dockerfile-mode)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(transient-mark-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)
(blink-cursor-mode t)
(show-paren-mode t)
(column-number-mode t)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(set-frame-font "Menlo-16")
(load-theme 'tango)

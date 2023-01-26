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
(straight-use-package 'org-mode)
(straight-use-package 
  '(yaml-mode
		      :type git
		      :repo "yoshiki/yaml-mode"
		      )
  )
(straight-use-package 'ruby-mode)
(straight-use-package 'dockerfile-mode)
(straight-use-package 'whitespace-cleanup-mode)
(add-hook 'ruby-mode-hook 'whitespace-cleanup-mode)
(straight-use-package 'terraform-mode)
(straight-use-package 'lsp-mode)

(require 'lsp)
(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection '("/usr/bin/terraform-ls" "serve"))
                  :major-modes '(terraform-mode)
                  :server-id 'terraform-ls))
(setq read-process-output-max (* 1024 1024))
(add-hook 'terraform-mode-hook #'lsp)
(add-to-list 'load-path "/home/slikens/.emacs.d/straight/repos/lsp-mode/clients")
(require 'lsp-terraform)
(straight-use-package 'rust-mode)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; Other Settings

(setq package-enable-at-startup nil)

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

(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq make-backup-files nil)
(setq auto-save-default nil)

(load-theme 'spacemacs-dark t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package projectile
  :ensure t
  :init
    (projectile-mode 1))

(use-package dashboard
  :ensure t
  :config
    (dashboard-setup-startup-hook)
    (setq dashboard-items '((recents  . 5)
			    (projects . 5)))
    (setq dashboard-banner-logo-title "Welcome to Chris's Emacs!"))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
    (setq spaceline-buffer-encoding-abbrev-p nil)
    (setq spaceline-line-column-p nil)
    (setq spaceline-line-p nil)
    (setq powerline-default-separator (quote arrow))
    (spaceline-spacemacs-theme))

(use-package web-mode
    :ensure t
    :config
	 (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
	 (setq web-mode-engines-alist
	       '(("django"    . "\\.html\\'")))
	 (setq web-mode-ac-sources-alist
	       '(("css" . (ac-source-css-property))
		 ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

(setq web-mode-enable-auto-closing t)
(setq web-mode-enable-auto-quoting t)) ; this fixes the quote problem I mentioned

(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)

;; Setup JS2 mode
(use-package js2-mode
  :ensure t
  )

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)


(use-package js2-refactor
  :ensure t)
(use-package xref-js2
  :ensure t)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

(use-package company-tern
  :ensure t)

(require 'company)
(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
			   (tern-mode)
			   (company-mode)))

;; Disable completion keybindings, as we use xref-js2 instead
(define-key tern-mode-keymap (kbd "M-.") nil)
(define-key tern-mode-keymap (kbd "M-,") nil)

(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(use-package company
  :ensure t
  :config
    (setq company-dabbrev-downcase 0)
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 2)    
  :init
    (add-hook 'after-init-hook 'global-company-mode))

(with-eval-after-load 'company
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous))

(use-package magit
  :ensure t
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 50)
  :bind
    ("M-g" . magit-status))

(setq make-backup-files nil)
(setq auto-save-default nil)

(load-theme 'spacemacs-dark t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package projectile
  :ensure t
  :init
    (projectile-mode 1))

(use-package dashboard
  :ensure t
  :config
    (dashboard-setup-startup-hook)
    (setq dashboard-items '((recents  . 5)
			    (projects . 5)))
    (setq dashboard-banner-logo-title "Welcome to Chris's Emacs!"))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
    (setq spaceline-buffer-encoding-abbrev-p nil)
    (setq spaceline-line-column-p nil)
    (setq spaceline-line-p nil)
    (setq powerline-default-separator (quote arrow))
    (spaceline-spacemacs-theme))

(use-package rainbow-mode
  :ensure t
  :init
    (rainbow-mode 1))

(use-package flycheck
  :ensure t)

(add-hook 'after-init-hook #'global-flycheck-mode)

(use-package fiplr
  :ensure t)
(global-set-key (kbd "C-x f") 'fiplr-find-file)

(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(use-package company
  :ensure t
  :config
    (setq company-dabbrev-downcase 0)
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 2)    
  :init
    (add-hook 'after-init-hook 'global-company-mode))

(with-eval-after-load 'company
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous))

(use-package magit
  :ensure t
  :config
  (setq magit-push-always-verify nil)
  (setq git-commit-summary-max-length 50)
  :bind
    ("M-g" . magit-status))

(use-package org-bullets
  :ensure t
  :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(unless (package-installed-p 'alchemist)
  (package-install 'alchemist))

(use-package py-autopep8
    :ensure t)
  (use-package elpy
    :ensure t)

;;  (elpy-enable)
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

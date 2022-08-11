
; ┌─────────┐
; │ PACKAGE │
; └─────────┘

(use-package ivy
  :diminish
  :init(which-key-mode)
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))


(use-package all-the-icons
  :if (display-graphic-p))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))



(use-package which-key
  :init(which-key-mode)
  :diminish which-key-mode
  :config
    (setq which-key-idle-delay 0.1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("s-p" . counsel-M-x)
	 ("C-x b" . counsel-iubffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-varibale)
  ([remap describe-key] . helpful-key))

(use-package org)
(use-package org-bullets
    :after org
    :hook (org-mode . org-bullets-mode)
    :custom
    (org-bullets-bullet-list '("◉" "☯" "○" "☯" "✸" "☯" "✿" "☯" "✜" "☯" "◆" "☯" "▶")))


(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/quant_alpha")
    (setq projectile-project-search-path '("~/quant_alpha")))
  (setq projectile-switch-project-action #'projectile-dired))



(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;(use-package evil-magit
;  :after magit)

;; Or if you use use-package
(use-package dashboard
  :ensure t
  :init
  (progn
    ;(setq dashboard-startup-banner "~/Downloads/IMG_D39C1E9B3D4A-1.jpeg")
    ;(setq dashboard-startup-banner "~/Downloads/eva.png")
    (setq dashboard-startup-banner
	  (when (display-graphic-p) "~/.emacs.d/dashboard/eva.png"))
    (setq dashboard-banner-logo-title "HI Emacs")
    (setq dashboard-set-heading-icons t)
    (setq dashboard-set-file-icons t)
    (setq dashboard-items '((recents . 5)
			    (projects . 5)))
    (setq dashboard-center-content t)
    (setq dashboard-image-banner-max-width 300)
    (setq dashboard-image-banner-max-height 300)
    )
 

  :config
  (dashboard-setup-startup-hook))




(use-package anaconda-mode)
(use-package auto-complete)



;-----------
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))
(setq org-confirm-babel-evaluate nil)


(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

; (use-package org-tempo)

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))


(use-package lsp-ui)

(provide 'init-packages)

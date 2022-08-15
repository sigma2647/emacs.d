
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

;
(defun efs/org-mode-setup ()
  (org-indent-mode))
  ; (variable-pitch-mode 1)
  ; (visual-line-mode 1))

(use-package org
  :pin org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"))
  ;(setq org-startup-indented t))

(use-package org-bullets
    :after org
    :hook (org-mode . org-bullets-mode)
    :custom
    (org-bullets-bullet-list '("◉" "☯" "○" "☯" "✸" "☯" "✿" "☯" "✜" "☯" "◆" "☯" "▶")))

; (dolist (face '((org-level-1 . 1.2)
;                   (org-level-2 . 1.1)
;                   (org-level-3 . 1.05)
;                   (org-level-4 . 1.0)
;                   (org-level-5 . 1.1)
;                   (org-level-6 . 1.1)
;                   (org-level-7 . 1.1)
;                   (org-level-8 . 1.1)))
;     (set-face-attribute (car face) nil :font "JetBrains Mono" :weight 'regular :height (cdr face)))



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

; Or if you use use-package
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
 (add-hook 'after-init-hook 'dashboard-refresh-buffer)

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


  (use-package typescript-mode
    :mode "\\.ts\\'"
    :hook (typescript-mode . lsp-deferred)
    :config
    (setq typescript-indent-level 2))

(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package company
 :after lsp-mode
 :hook (lsp-mode . company-mode)
 :bind (:map company-active-map
        ("<tab>" . company-complete-selection))
       (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common))
 :custom
 (company-minimum-prefix-length 1)
 (company-idle-delay 0.0))
  


(provide 'init-packages)


; ┌─────────┐
; │ PACKAGE │
; └─────────┘


; (use-package try
;   :ensure t)
;
;
; ;; Org-mode
; (use-package org-bullets
;   :ensure t
;   :config
;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;
; (use-package org
;   :ensure t)
;
; (use-package evil
;   :ensure t)
; ;开启vim-mode
; (evil-mode 1)
;
; (use-package doom-modeline
;   :ensure t
;   :hook (after-init . doom-modeline-mode))
; ;自动重启emacs
; (use-package restart-emacs
;   :ensure t)
;
; ;移动代码块
; (use-package drag-stuff
;   :bind (("M-<up>" . drag-stuff-up)
;          ("M-<down>" . drag-stuff-down)))
;
; ;:leader
; ;(use-package evil-leader
;              ;:bind (("SPC" . evil-leader-mode)))
;              ;:config
;
; ;(global-evil-leader-mode)
;
; ;; Allow C-h to trigger which-key before it is done automatically
; (setq which-key-show-early-on-C-h t)
; ;; make sure which-key doesn't show normally but refreshes quickly after it is
; ;; triggered.
; (setq which-key-idle-delay 0.3)
; (setq which-key-idle-secondary-delay 0.05)
; (which-key-mode)

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
  :config
  (dashboard-setup-startup-hook))

(use-package anaconda-mode)
(use-package auto-complete)


(provide 'init-packages)

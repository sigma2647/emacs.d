; ┌─────────┐
; │ PACKAGE │
; └─────────┘

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Org-mode
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org
  :ensure t)

(use-package evil
  :ensure t)
;开启vim-mode
(evil-mode 1)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

;自动重启emacs
(use-package restart-emacs
  :ensure t)

;移动代码块
(use-package drag-stuff
  :bind (("M-<up>" . drag-stuff-up)
         ("M-<down>" . drag-stuff-down)))


(use-package ivy
  :diminish
  :bind ((:map ivy-minibuffer-map)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 ("C-n" . ivy-next-line)
	 ("C-p" . ivy-previous-line)
	 ("C-d" . ivy-done)))
(ivy-mode 1)



;:leader
;(use-package evil-leader
             ;:bind (("SPC" . evil-leader-mode)))
             ;:config

;(global-evil-leader-mode)

;; Allow C-h to trigger which-key before it is done automatically
(setq which-key-show-early-on-C-h t)
;; make sure which-key doesn't show normally but refreshes quickly after it is
;; triggered.
(setq which-key-idle-delay 0.3)
(setq which-key-idle-secondary-delay 0.05)
(which-key-mode)


(provide 'init-packages)

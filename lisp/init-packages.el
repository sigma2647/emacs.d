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


;自动重启emacs
(use-package restart-emacs)

;移动代码块
(use-package drag-stuff
  :bind (("M-<up>" . drag-stuff-up)
         ("M-<down>" . drag-stuff-down)))



(provide 'init-packages)

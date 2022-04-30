; ┌───────┐
; │ Theme │
; └───────┘

(custom-set-variables
 '(custom-safe-themes
   '("1436985fac77baf06193993d88fa7d6b358ad7d600c1e52d12e64a2f07f07176" default)))
(use-package dracula-theme
  :ensure t)
(load-theme 'dracula)

(provide 'init-ui)



;set fontsize
(set-face-attribute 'default nil :height 300)

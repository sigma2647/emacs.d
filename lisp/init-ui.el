; ┌───────┐
; │ Theme │
; └───────┘

(custom-set-variables
 '(custom-safe-themes
   '("1436985fac77baf06193993d88fa7d6b358ad7d600c1e52d12e64a2f07f07176" default)))
(use-package dracula-theme
  :ensure t)
(load-theme 'dracula)




;set fontsize
(set-face-attribute 'default nil :height 210)


(setq display-line-numbers-type 'relative)  ; 相对行号
(global-display-line-numbers-mode t)      ; 全局显示行号


; 不同的buffer隐藏行号
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))





(provide 'init-ui)

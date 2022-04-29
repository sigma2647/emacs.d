(add-to-list 'load-path
             (expand-file-name (concat user-emacs-directory "lisp")))



(require 'init-startup)
(require 'init-elpa)
(require 'init-packages)
(require 'init-ui)


;https://www.bilibili.com/video/BV13g4y167Zn?p=17&t=75.8
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1436985fac77baf06193993d88fa7d6b358ad7d600c1e52d12e64a2f07f07176" default))
 '(package-selected-packages
   '(## which-key use-package try org-bullets evil-visual-mark-mode dracula-theme)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

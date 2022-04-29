(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1436985fac77baf06193993d88fa7d6b358ad7d600c1e52d12e64a2f07f07176" default)))

(setq inhibit-startup-message t) ;忽略启动消息
(setq initial-scratch-message "")
(setq ring-bell-function 'ignore) ;关闭声音


(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
         '("melpa" . "https://melpa.org/packages/"))

;;如果emacs版本大于26,则使用下面软件源
;(when (>= emacs-major-version 26)
    ;(require 'package)
    ;(package-initialize)
    ;(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
				 ;("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ;("org" . "http://elpa.emacs-china.org/org/")
			 ;("marmalade" . "http://elpa.emacs-china.org/marmalade/")
			 ;("user42" . "http://elpa.emacs-china.org/user42/"))))

(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

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
(evil-mode 1)


;; Theme
(use-package dracula-theme
  :ensure t)
(load-theme 'dracula)


;; 如何关闭后重新打开
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



;; setting
;; linenumber
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)


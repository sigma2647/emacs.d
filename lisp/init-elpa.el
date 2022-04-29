; ┌─────────┐
; │ PACKAGE │
; └─────────┘

(setq package-check-signature nil)  ;; don't check package signatures
(setq package-enable-at-startup nil)



(add-to-list 'package-archives
         '("melpa" . "https://melpa.org/packages/"))


(require 'package)

(unless (bound-and-true-p package--initialized) ;; To avoid warnings on 27
  (package-initialize))

(unless package-archive-contents
  (package-refresh-contents))

;; 刷新软件索引
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))










;基础格式
;(use package smooth-scrolling
;     :ensure t ;
;     :defer null
;     :init 
;     :config
;     :bind
;     :hook) ;hook模式的绑定
;(setq use-package-always-ensure t) ;确保所有包都被安装
;(setq use-package-always-defer t) ;默认所有包都延迟加载
;(setq use-package-verbose t) ;显示所有包的名字
;(setq use-package-demand t)



;;如果emacs版本大于26,则使用下面软件源
;(when (>= emacs-major-version 26)
    ;(require 'package)
    ;(package-initialize)
    ;(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
				 ;("melpa" . "http://elpa.emacs-china.org/melpa/")
			 ;("org" . "http://elpa.emacs-china.org/org/")
			 ;("marmalade" . "http://elpa.emacs-china.org/marmalade/")
			 ;("user42" . "http://elpa.emacs-china.org/user42/"))))
(provide 'init-elpa)

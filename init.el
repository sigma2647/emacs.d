(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp/")))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq custom-file (locate-user-emacs-file "custom.el"))


; ┌──────────┐
; │ 默认路径 │
; └──────────┘
(setq default-directory "~/")




; (require 'init-system)
(require 'init-options)
(require 'init-startup)
(require 'init-elpa)
; (require 'init-packages)
; (require 'init-ui)
(require 'init-keymap)



; ┌───────┐
; │ theme │
; └───────┘

(load-theme 'modus-vivendi t)


(when (file-exists-p custom-file)
  (load-file custom-file))




;; 调整垃圾收集阈值

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;https://github.com/purcell/emacs.d/blob/master/init.el
;大师配置

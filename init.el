(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq custom-file (locate-user-emacs-file "custom.el"))


(set-frame-size (selected-frame) 850 760 'pixelwise)
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

; ┌──────────┐
; │ 默认路径 │
; └──────────┘




; (require 'init-system)
(require 'init-options)
(require 'init-startup)
(require 'init-elpa)
(require 'init-dashboard)
(require 'init-packages)
(require 'init-ui)
(require 'init-evil)
(require 'init-function)
(require 'init-markdown)
(require 'init-org)
(require 'core-keymap)
(require 'init-py)



; ┌───────┐
; │ theme │
; └───────┘

;(load-theme 'doom-ayu-dark t)

(load-theme 'doom-sourcerer t)



(when (file-exists-p custom-file)
  (load-file custom-file))




;; 调整垃圾收集阈值

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))
(setq gc-cons-percentage 0.6)



;https://github.com/purcell/emacs.d/blob/master/init.el
;大师配置






; ┌─────────┐
; │ setting │
; └─────────┘



(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t) ;忽略启动消息
(setq initial-scratch-message "")
(setq ring-bell-function 'ignore) ;关闭声音




(provide 'init-startup)

; ┌────┐
; │ Ui │
; └────┘

(menu-bar-mode -1)  ;disable menu bar
(tool-bar-mode -1)  ;disable tool bar
(scroll-bar-mode -1)
(recentf-mode 1)  ;recent file


(setq inhibit-startup-message t
      visible-bell nil)   ; 忽略启动消息

(setq initial-scratch-message nil) ;
(setq ring-bell-function 'ignore)  ; 关闭声音


; ┌────────┐
; │ editor │
; └────────┘
(setq display-line-numbers-type 'relative) ; 相对行号
(global-display-line-numbers-mode t)       ; 全局显示行号


(provide 'init-options)

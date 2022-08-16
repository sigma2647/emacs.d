; ┌────┐
; │ Ui │
; └────┘

(menu-bar-mode -1)	;disable menu bar
(tool-bar-mode -1)	;disable tool bar
(scroll-bar-mode -1)
(setq inhibit-startup-message t
      visible-bell nil)   ; 忽略启动消息

(setq use-dialog-box nil) ; don't pop up ui dialogs
(setq initial-scratch-message nil) ;

(global-auto-revert-mode 1)  ;auto refresh buffer content !!
(setq global-auto-revert-non-file-buffers t)

(recentf-mode 1)	;recent file
(save-place-mode 1)	; Remembering Last Editing Positions

(setq history-lenth 25)
(savehist-mode 1)



(setq ring-bell-function 'ignore)  ; 关闭声音


; ┌────────┐
; │ editor │
; └────────┘

(column-number-mode)
;(split-window-right)

(setq display-line-numbers-type 'relative) ; 相对行号
(global-display-line-numbers-mode t)       ; 全局显示行号



;; 不显示行号
(dolist (mode '(text-mode-hook
                prog-mode-hook
                shell-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))




; emacs 29

(when (>= emacs-major-version 29)
    (pixel-scroll-precision-mode)) ;像素滚动


; Replace list hyphen with dot
(font-lock-add-keywords 'org-mode
			'(("^ *\\([-]\\) "
			   (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(provide 'init-options)








(setq mac-option-modifier 'meta
      mac-command-modifier 'super)

(global-set-key (kbd "s-a") 'mark-whole-buffer) ;;对应Windows上面的Ctrl-a 全选
(global-set-key (kbd "s-c") 'kill-ring-save) ;;对应Windows上面的Ctrl-c 复制
(global-set-key (kbd "s-s") 'save-buffer) ;; 对应Windows上面的Ctrl-s 保存
(global-set-key (kbd "s-v") 'yank) ;对应Windows上面的Ctrl-v 粘贴
(global-set-key (kbd "s-z") 'undo) ;对应Windows上面的Ctrol-z 撤销
(global-set-key (kbd "s-Z") 'redo) ;对应Windows上面的Ctrol-z 撤销
(global-set-key (kbd "s-x") 'kill-region) ;对应Windows上面的Ctrol-x 剪切
(global-set-key (kbd "s-o") 'counsel-recentf) ;; 
(global-set-key (kbd "s-/") 'comment-line)





(global-set-key (kbd "C-M-J") 'counsel-switch-buffer) ;对应Windows上面的Ctrol-x 剪切




; ┌──────────────┐
; │ 关闭C-触控板 │
; └──────────────┘
(global-set-key (kbd "<C-wheel-up>") nil)
(global-set-key (kbd "<C-wheel-down>") nil)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)  ;ecs

;; (define org-active-map
;; 	(kdb "M-j") 'org-metadown
;; 	(kdb "M-k") 'org-metaup)
	
;; (global-set-key (kbd "M-j") 'comment-line)


; ┌────────┐
; │ Buffer │
; └────────┘
(global-set-key (kbd "s-}") 'next-buffer)
(global-set-key (kbd "s-{") 'previous-buffer)



; ┌──────────────────┐
; │ org mode key map │
; └──────────────────┘
; (define-key org-mode-map (kbd "C-c s") 'org-agenda)
;; (define-key org-mode-map (kbd "M-j") 'org-agenda)



;; (define-key org-mode-map (kbd "M-j") 'org-metadown)
;; (define-key org-mode-map (kbd "M-k") 'org-metaup)
;; (define-key org-mode-map (kbd "M-o") 'org-agenda)

(define-key org-mode-map (kbd "M-j") nil)
(define-key org-mode-map (kbd "M-k") nil)
(global-set-key (kbd "M-j") nil)
(global-set-key (kbd "M-k") nil)

(define-key org-mode-map (kbd "C-o") nil)

(global-set-key (kbd "C-o") nil)

(with-eval-after-load 'org
      (define-key org-mode-map (kbd "M-j") 'org-metadown) 
      (define-key org-mode-map (kbd "M-k") 'org-metaup))


;; (org-defkey org-mode-map (kbd "M-j") #'org-metadown)
;; (org-defkey org-mode-map (kbd "M-k") #'org-metaup)

;; (define-key org-mode-map (kbd "C-M-f")    'org-metadown)
;; (define-key org-mode-map (kbd "C-M-b")    'org-metaup)
;; (define-key org-mode-map (kbd "C-M-l")    'org-shiftright)
;; (define-key org-mode-map (kbd "C-M-j")    'org-shiftleft)
;; (define-key org-mode-map (kbd "C-M-i")    'org-shiftup)
;; (define-key org-mode-map (kbd "C-M-k")    'org-shiftdown)
;; (define-key org-mode-map (kbd "C-M-_")    'live-decrement-number-at-point)

;; (defun my-org-mode-hook ()
;;   (define-key global-map '[(control tab)] 'other-window)
;;   (define-key global-map '[(shift control tab)] 'my-other-window-back)
;;   (global-set-key '[(control tab)] 'other-window)
;;   (global-set-key '[(shift control tab)] 'my-other-window-back)
;;   (local-set-key '[(control tab)] 'other-window)
;;   (local-set-key '[(shift control tab)] 'my-other-window-back)
;;   )
;; (add-hook 'org-mode-hook 'my-org-mode-hook)

;; (with-eval-after-load "org"
;;   (define-key org-mode-map (kbd "M-j") 'org-metadown)
;;   (define-key org-mode-map (kbd "M-k") 'org-metaup))
;; ;; (org-defkey org-mode-map (kbd "M-j") #'org-metadown)
;; (org-defkey org-mode-map (kbd "M-k") #'org-metaup)



(provide 'core-keymap)


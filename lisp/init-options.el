
(require 'init-function)
;; Window configuration
(setq frame-inhibit-implied-resize t) ;; Supposed to hasten startup

;; Less clutter (this is what dfrosted12 uses so I trust that)
(add-to-list 'default-frame-alist '(tool-bar-lines . 0))
(add-to-list 'default-frame-alist '(menu-bar-lines . 0))
(add-to-list 'default-frame-alist '(vertical-scroll-bars))

; (set-background-color "chocolate3")
;; This makes the Aqua titlebar color the same as Emacs.
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))

; ┌────┐
; │ Ui │
; └────┘

(guiconfig)
(setq dnd-protocol-alist
      '(("" . your-dnd-handler)))


(global-hl-line-mode 1)

(setq inhibit-startup-message t
      visible-bell nil)   ; 忽略启动消息

(setq use-dialog-box nil) ; don't pop up ui dialogs
(setq initial-scratch-message nil) ;

(global-auto-revert-mode 1)  ;auto refresh buffer content !!
(setq global-auto-revert-non-file-buffers t)

(recentf-mode 1)	;recent file

(require 'saveplace)
(setq-default save-place t)

(setq history-lenth 25)
(savehist-mode 1)



(setq ring-bell-function 'ignore)  ; 关闭声音

;;;;;;;;;
;; org ;;
;;;;;;;;;
(setq org-M-RET-may-split-line '((headline . nil)))

; ┌────────┐
; │ editor │
; └────────┘

(column-number-mode)
;(split-window-right)

(setq display-line-numbers-type 'relative) ; 相对行号
(global-display-line-numbers-mode t)       ; 全局显示行号



;; 显示行号
(dolist (mode '(text-mode-hook
                prog-mode-hook
                ; shell-mode-hook
                conf-mode-hook
                ))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))


;; 不显示行号
(dolist (mode '(org-mode-hook
                shell-mode-hook
                eshell-mode-hook
		treemacs-mode-hook
                markdown-mode-hook
                ))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


(dolist (mode '(
                markdown-mode-hook
                org-mode-hook
                ))
  (add-hook mode (lambda () (olivetti-mode 1))))


(winner-mode 1)
(setq frame-resize-pixelwise t)
(setq ns-pop-up-frames nil) ;; When opening a file (like double click) on Mac, use an existing frame
(setq window-resize-pixelwise nil)
(setq split-width-threshold 80) ;; How thin the window should be to stop splitting vertically (I think)
(setq sentence-end-double-space nil)  ;; Sentences end with one space

(setq trash-directory "~/.Trash")
(setq delete-by-moving-to-trash t)






;;;;;;;;;;;;;;
;; emacs 29 ;;
;; 像素滚动 ;;
;;;;;;;;;;;;;;
(when (>= emacs-major-version 29)
    (pixel-scroll-precision-mode)) 



; (font-lock-add-keywords 'markdown-mode
; 			'(("^ *\\([-]\\) "
; 			   (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;(setq default-frame-alist '(
;       (left . 3000)
;       (width . 3000)
;       (top . 1000)
;       (height . 1000)
;       (fullscreen . fullheight)
;       (internal-border-width . 8)))


;;;;;;;;;;;;;;;
;; org-babel ;;
;;;;;;;;;;;;;;;
(org-babel-do-load-languages 'org-babel-load-languages
 '(
    (emacs-lisp . t)
    (shell . t)
    (python . t))
 )

(setq org-confirm-babel-evaluate nil)



(provide 'init-options)


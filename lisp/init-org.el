(require 'init-function)

(setq org-hide-leading-stars t)
(use-package org
  :pin org
  :hook (org-mode . efs/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"))
  ;; :bind(:map org-mode-map
  ;; 	   ("<M-up>"	 . nil)
  ;; 	   ("<M-down>"	 . nil))
  ;; (setq org-startup-indented t))

(use-package org-bullets
    :after org
    :hook (org-mode . org-bullets-mode)
    :custom
    (org-bullets-bullet-list '("◉" "☯" "○" "☯" "✸" "☯" "✿" "☯" "✜" "☯" "◆" "☯" "▶")))

;; ;; (defun me-org-mode-remove-stars ()
;;   (font-lock-add-keywords
;;    nil
;;    '(("^\\*+ "
;;       (0
;;        (prog1 nil
;;          (put-text-property (match-beginning 0) (match-end 0)
;;                             'invisible t)))))))

;; (add-hook 'org-mode-hook #'me-org-mode-remove-stars)
;; (setq org-hide-leading-stars t)
;; (setq org-hide-leading-stars t

;; (setq org-startup-indented t
;;       org-bullets-bullet-list '(" ")
;;       org-ellipsis "  "
;;       org-pretty-entities t
;;       org-hide-emphasis-markers t

;;       org-agenda-block-separator ""
;;       org-fontify-whole-heading-line t
;;       org-fontify-done-headline t
;;       org-fontify-quote-and-verse-blocks t
;; )


;
; (lambda () (progn
;              (setq left-margin-width 2)
;              (setq right-margin-width 2)
;              (set-window-buffer nil (current-buffer))))



; Replace list hyphen with dot
(font-lock-add-keywords 'org-mode
			'(("^ *\\([-]\\) "
			   (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;;   (let* ((variable-tuple
;;           (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
;;                 ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
;;                 ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
;;                 ((x-list-fonts "Maple Mono")      '(:font "Maple Mono"))
;;                 ((x-list-fonts "Verdana")         '(:font "Verdana"))
;;                 ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
;;                 (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
;;          (base-font-color     (face-foreground 'default nil 'default))
;;          (headline           `(:inherit default :weight bold :foreground ,base-font-color)))
  
;;     (custom-theme-set-faces
;;      'user
;;      ;;;;;;;;;;;
;;      ;; block ;;
;;      ;;;;;;;;;;;
;;      '(org-block-begin-line		((t (:underline "#A7A6AA" :background "#1f1f1f" :foreground "#404040" :extend t))))
;;      '(org-block			((t (:background "#1f1f1f" :extend t))))
;;      '(org-block-end-line		((t (:overline "#A7A6AA" :foreground "#404040" :background "#1f1f1f" :extend t :underline nil))))
;;      '(org-code				((t (:foreground "#957f5f":family "Maple Mono"))))
;;      ;; '(org-document-title		((t (:foreground "Maple Mono" :weight bold :height 2.0))))
;;      ;; '(org-hide				((t (:foreground "#E5E9F0" :height 0.1))))
  
;;      '(org-table			((t (:inherit fixed-pitch :foreground "#83a598" :family "Microsoft YaHei Mono"))))
;;      ;; '(org-document-info		((t (:foreground "dark orange"))))
;;      ;; '(org-document-info-keyword	((t (:inherit (shadow fixed-pitch)))))
;;      ;; '(org-indent			((t (:inherit (org-hide fixed-pitch)))))
;;      '(org-indent			((t (:family "Maple Mono"))))
;;      '(org-link				((t (:underline t))))
  
;;      ;;;;;;;;;;;;;
;;      ;; heading ;;
;;      ;;;;;;;;;;;;;
;;      '(org-level-8			((t (,@headline ,@variable-tuple))))
;;      '(org-level-7			((t (,@headline ,@variable-tuple))))
;;      '(org-level-6			((t (,@headline ,@variable-tuple))))
;;      '(org-level-5			((t (,@headline ,@variable-tuple))))
;;      '(org-level-4			((t (,@headline ,@variable-tuple :height 1.1))))
;;      '(org-level-3			((t (,@headline ,@variable-tuple :height 1.25))))
;;      '(org-level-2			((t (,@headline ,@variable-tuple :height 1.5))))
;;      '(org-level-1			((t (,@headline ,@variable-tuple :height 1.75))))
;;      '(org-document-title		((t (:height 2.0 :underline nil :foreground "#83a598" ))))))
;;   ;

;; ;; (custom-set-faces
;;  '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
;;  ;; '(org-block-begin-line ((t (:extend t :background "#f7e0c3" :foreground "gray"
;;  ;;                              :weight semi-bold :height 151 :family "Maple Mono"))))

;;  '(org-code ((t (
;; 		 ;; :foreground "#957f5f"
;; 		    :family "JetBrains Mono"))))
;;  ;; '(org-document-title ((t (:foreground "Maple Mono" :weight bold :height 2.0))))
;;  ;; '(org-hide ((t (:foreground "#E5E9F0" :height 0.1))))

;;  ;; '(org-list-dt ((t (:foreground "#7382a0"))))
;;  ;;'(org-verbatim ((t (:foreground "#81895d" :family "Latin Modern Mono"))))
;;  '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
;;  '(org-block ((t (:inherit fixed-pitch))))
;;  '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))

;;  ;; Org table font 表格 TODO 单独设置中文字体的对齐
;;  ;; '(org-table ((t (:family "Maple Mono"))))

;;  ;; TODO set the color following this
;;  '(org-block ((t (:extend t
;; 			  ;; :background "#f7e0c3"
;; 			  ;; :foreground "#5b5143"
;; 			  :family "JetBrains Mono"))))
;;  '(org-code ((t (:inherit (shadow fixed-pitch)))))
;;  ;; '(variable-pitch ((t (:family "DejaVu Serif" :height 150))))
;;  ;; '(fixed-pitch ((t (:family "mononoki" :height 160))))



;; ;;;;;;;;;;;;;
;; ;; heading ;;
;; ;;;;;;;;;;;;;

;;  '(org-level-1
;;    ((t (:inherit outline-1 :height 1.25 :family "Maple Mono"
;; 			     ;; :foreground "#076678"
;; 			     ))))
;;  '(org-level-2
;;    ((t (:inherit outline-2 :height 1.15 :family "Maple Mono"
;; 			     ;; :foreground "#EEC591"
;; 			     ))))
;;  '(org-level-3
;;    ((t (:inherit outline-3 :height 1.05 :family "Maple Mono"))))
;;  '(org-level-4
;;    ((t (:inherit outline-4 :height 1.1  :family "Maple Mono"))))
;;  '(org-level-5
;;    ((t (:inherit outline-5 :height 1.05 :family "Maple Mono"))))
;;  '(org-level-6
;;    ((t (,@headline ,@variable-tuple))))
;;  '(org-level-7
;;    ((t (,@headline ,@variable-tuple))))
;;  '(org-level-8
;;    ((t (,@headline ,@variable-tuple))))

;;  '(org-document-title
;;    ((t (:height 2.0
;; 	:underline nil
;; 	:family "Maple Mono"
;; 	:foreground "#076678"
;; 	;; :foreground "#ffffff"
;; 		   )))))

(provide 'init-org)

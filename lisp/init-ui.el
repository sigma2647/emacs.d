; ┌───────┐
; │ Theme │
; └───────┘

(require 'init-function)

;; (custom-set-variables
;;  '(custom-safe-themes
;;    '("1436985fac77baf06193993d88fa7d6b358ad7d600c1e52d12e64a2f07f07176" default)))


;set fontsize
;(set-face-attribute 'default nil :height 170)

; dashboard
(setq fancy-splash-image centaur-logo)


; ┌──────────────┐
; │ markdon font │
; └──────────────┘
; (dolist (mode '(markdown-mode-hook))
;   (add-hook mode (lambda () (set-frame-font "Maple Mono 15" nil t))))



;; (set-frame-font "JetBrains Mono" nil t)


;(set-frame-font emacs-english-font emacs-cjk-font '(20 . 12))

;; Logo
(setq fancy-splash-image centaur-logo)




;; (set-font-en "Maple Mono" 15)
(set-font-en "JetBrains Mono" 15)
(set-font-zh "Microsoft YaHei Mono" 15)




;; (custom-set-faces
;;  '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
;;  ; '(org-block-begin-line ((t (:extend t :background "#f7e0c3" :foreground "gray"
;;  ;                              :weight semi-bold :height 151 :family "Maple Mono"))))

;;  '(org-code ((t (
;; 		 ;; :foreground "#957f5f"
;; 		    :family "JetBrains Mono"))))
;;  '(org-document-title ((t (:foreground "Maple Mono" :weight bold :height 2.0))))
;;  ;; '(org-hide ((t (:foreground "#E5E9F0" :height 0.1))))

;;  ;; '(org-list-dt ((t (:foreground "#7382a0"))))
;;  ;;'(org-verbatim ((t (:foreground "#81895d" :family "Latin Modern Mono"))))
;;  '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
;;  '(org-block ((t (:inherit fixed-pitch))))
;;  '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))

;;  ;; Org table font
;;  '(org-table ((t (:family "Maple Mono"))))

;;  ;; TODO set the color following this
;;  '(org-block ((t (:extend t
;; 			  ;; :background "#f7e0c3"
;; 			  ;; :foreground "#5b5143"
;; 			  :family "JetBrains Mono"))))
;;  '(org-code ((t (:inherit (shadow fixed-pitch)))))
;;  ;; '(variable-pitch ((t (:family "DejaVu Serif" :height 150))))
;;  ;; '(fixed-pitch ((t (:family "mononoki" :height 160))))

;;  ;;;;;;;;;;;;;
;;  ;; heading ;;
;;  ;;;;;;;;;;;;;
;;  '(org-level-1 ((t (:inherit outline-1 :height 1.25 :family "Maple Mono"
;; 			     ;; :foreground "#076678"
;; 			     ))))
;;  '(org-level-2 ((t (:inherit outline-2 :height 1.15 :family "Maple Mono"
;; 			     ;; :foreground "#EEC591"
;; 			     ))))
;;  '(org-level-3 ((t (:inherit outline-3 :height 1.05 :family "Maple Mono"))))
;;  '(org-level-4 ((t (:inherit outline-4 :height 1.1  :family "Maple Mono"))))
;;  '(org-level-5 ((t (:inherit outline-5 :height 1.05 :family "Maple Mono"))))
;;  ;;'(org-level-6 ((t (,@headline ,@variable-tuple))))
;;  ;;'(org-level-7 ((t (,@headline ,@variable-tuple))))
;;  ;;'(org-level-8 ((t (,@headline ,@variable-tuple))))

;;  '(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil)))))


(provide 'init-ui)

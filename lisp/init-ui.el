; ┌───────┐
; │ Theme │
; └───────┘

(custom-set-variables
 '(custom-safe-themes
   '("1436985fac77baf06193993d88fa7d6b358ad7d600c1e52d12e64a2f07f07176" default)))

(set-background-color "chocolate3")


;set fontsize
;(set-face-attribute 'default nil :height 170)
;; (set-frame-font "Maple Mono 15" nil t)


;; (set-frame-font "Microsoft YaHei Mono" nil t)


;(set-frame-font emacs-english-font emacs-cjk-font '(20 . 12))


;(defun create-frame-font-mac()
;  ;; English
;  (set-face-attribute
;   'default nil :font "Maple Mono 14")
;  (dolist (charset '( han symbol cjk-misc bopomofo))
;  ;; Chinese
;    (set-fontset-font (frame-parameter nil 'font)
;  					  charset
;                      (font-spec :family "Microsoft YaHei Mono" :size 16))))
  ;; ;; Japanese
  ;; (set-fontset-font (frame-parameter nil 'font)
  ;; ;; 'kana
  ;; (font-spec :family "Hiragino Sans" :size 16))
  ;; ;; Korean
  ;; (set-fontset-font (frame-parameter nil 'font)
  ;; ;; 'hangul
  ;; (font-spec :family "Apple SD Gothic Neo" :size 18))
  ;; )



(defun set-font (english chinese english-size chinese-size)
  (set-face-attribute
   'default nil :font
   (format "%s:pixelsize=%d"  english english-size))

  (dolist
      (charset
       '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font) charset
     (font-spec :family chinese :size chinese-size))))


;; (set-font "Maple Mono" "Sarasa Mono SC Nerd" 14 14)
;; (set-font "Maple Mono" "Microsoft YaHei Mono" 14 14)
;; (set-font "Maple Mono" "Microsoft YaHei Mono" 14 14)
(set-font "MesloLGL Nerd Font Mono" "Sarasa Mono SC Nerd" 14 14)



(custom-set-faces
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0))))
 ;; '(org-block-begin-line ((t (:extend t :background "#f7e0c3" :foreground "gray"
 ;;                             :weight semi-bold :height 151 :family "CMU Typewriter Text"))))

 '(org-code ((t (
		 ;; :foreground "#957f5f"
		    :family "MesloLGSDZ Nerd Font Mono"))))
 ;; '(org-document-title ((t (:foreground "Maple Mono" :weight bold :height 2.0))))
 ;; '(org-hide ((t (:foreground "#E5E9F0" :height 0.1))))

 ;; '(org-list-dt ((t (:foreground "#7382a0"))))
 ;;'(org-verbatim ((t (:foreground "#81895d" :family "Latin Modern Mono"))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
 ;; TODO set the color following this
 ;; '(org-block ((t (:extend t :background "#f7e0c3" :foreground "#5b5143" :family "Latin Modern Mono"))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 ;; '(variable-pitch ((t (:family "DejaVu Serif" :height 150))))
 ;; '(fixed-pitch ((t (:family "mononoki" :height 160))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "#076678" :weight extra-bold
                    :height 1.25))))
 '(org-level-2 ((t (:inherit outline-2 :foreground "#EEC591" :height 1.15 :family
                    "Maple Mono"))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.0  :family "Maple Mono"))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.1  :family "Maple Mono"))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.05 :family "Maple Mono"))))
 ;;'(org-level-6 ((t (,@headline ,@variable-tuple))))
 ;;'(org-level-7 ((t (,@headline ,@variable-tuple))))
 ;;'(org-level-8 ((t (,@headline ,@variable-tuple))))

 '(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil)))))



(provide 'init-ui)

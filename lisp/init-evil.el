(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"
  )

  (rune/leader-keys
    "t"  '(:ignore t :which-key "Toggles")
    "H"  '(dashboard-refresh-buffer :which-key "buffer")
    "tt" '(jb-hydra-theme-switcher/body :which-key "Change Theme")
    "fc" '(counsel-load-theme :which-key "Choose Theme")
    "fr" '(counsel-recentf :which-key "Recent File")
    "ff" '(find-file :which-key "Find File")
    "pc" '(eval-buffer :which-key "Packer Compile"))


  (general-define-key
   :states	'(normal motion visual)
   :keymaps	'override
   :prefix "SPC"
   "e"  '(treemacs :which-key "tree")
   "/" '(swiper :which-key "swiper") "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
   )

  (general-define-key
   :states	'(visual)
   :keymaps	'override
   :prefix "SPC"
   "s" '(align-regexp :which-key "previous buffer")
   )

  (general-def
  :states '(insert)
  "C-a" 'evil-beginning-of-visual-line
  "C-e" 'evil-end-of-visual-line
  "C-S-a" 'evil-beginning-of-line
  "C-S-e" 'evil-end-of-line
  "C-n" 'evil-next-visual-line
  "C-p" 'evil-previous-visual-line
  )
  (general-def
  :states '(normal visual)
  "S" 'save-buffer
  "H" 'evil-first-non-blank
  "L" 'end-of-line
  )
)


(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd ";") 'evil-normal-state)  ; 插入模式下的退出
  ;(define-key evil-insert-state-map "jk" 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  (define-key evil-normal-state-map (kbd "gr") 'lsp-find-references)
  (define-key evil-normal-state-map (kbd "gd") 'lsp-find-definition)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))


(use-package hydra)

;自定义
(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))



(rune/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))

(defun jib/load-theme (theme)
  "Enance `load-theme` by si"
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme theme t))

(defhydra jb-hydra-theme-switcher (:hint nil)
    ;; Dark
  ;; ("1" (jib/load-theme 'doom-one) "one")
  ("1" (jib/load-theme 'doom-flatwhite) "flatwhite")
  ("2" (jib/load-theme 'modus-vivendi) "modus-vivendi")
  ("3" (jib/load-theme 'doom-molokai) "molokai")
  ("4" (jib/load-theme 'doom-snazzy) "snazzy")
  ("5" (jib/load-theme 'doom-old-hope) "old-hope")
  ("6" (jib/load-theme 'doom-henna) "henna")
  ("7" (jib/load-theme 'kaolin-galaxy) "kaolin-galaxy")
  ("8" (jib/load-theme 'doom-peacock) "peacock")
  ("9" (jib/load-theme 'jake-doom-plain-dark) "jake-plain-dark")
  ("0" (jib/load-theme 'doom-monokai-machine) "monokai-machine")
  ("-" (jib/load-theme 'doom-xcode) "xcode")

  ;; Light
  ("z" (jib/load-theme 'doom-one-light) "one-light")
  ("x" (jib/load-theme 'modus-operandi) "modus-operandi")
  ("c" (jib/load-theme 'jake-doom-plain) "jake-plain")
  ("v" (jib/load-theme 'doom-flatwhite) "flatwhite")
  ("b" (jib/load-theme 'doom-opera-light) "opera-light")
  ("q" nil))

;(windresize)
;(windresize-exit)

;;;;;;;;;;;
;; remap ;;
;;;;;;;;;;;
(evil-define-key 'normal org-mode-map (kbd "RET") 'org-open-at-point)
(evil-define-key 'normal org-mode-map (kbd "M-j") 'org-metadown)
(evil-define-key 'normal org-mode-map (kbd "M-k") 'org-metaup)

(evil-define-key 'normal markdown-mode-map (kbd "RET") 'markdown-follow-thing-at-point)

;; (evil-define-key 'visual org-mode-map (kbd "}") 'evil-forward-paragraph)
;; (evil-define-key 'visual org-mode-map (kbd "{") 'evil-backward-paragraph)


;; Symbol Properties
;; event-symbol-element-mask
;;   (evil-ex-yank 0)
;; event-symbol-elements
;;   (evil-ex-yank)
;; modifier-cache
;;   ((0 . evil-ex-yank))

;; ;(define-key evil-normal-state-map (kbd "Y") 'evil-ex-yank evil-end-of-line)






;;;;;;;;;;;;;;;;;;;;
;; highlight yank ;;
;;;;;;;;;;;;;;;;;;;;
(defun meain/evil-yank-advice (orig-fn beg end &rest args)
  (pulse-momentary-highlight-region beg end)
  (apply orig-fn beg end args))

(advice-add 'evil-yank :around 'meain/evil-yank-advice)


;;;;;;;;;;;;;;;;;;;;
;; evil-multiedit ;;
;;;;;;;;;;;;;;;;;;;;
(use-package evil-multiedit)
(evil-multiedit-default-keybinds)
;; Highlights all matches of the selection in the buffer.
(define-key evil-visual-state-map "R" 'evil-multiedit-match-all)


;; Match the word under cursor (i.e. make it an edit region). Consecutive presses will
;; incrementally add the next unmatched match.
(define-key evil-normal-state-map (kbd "s-d") 'evil-multiedit-match-and-next)
;; Match selected region.
(define-key evil-visual-state-map (kbd "s-d") 'evil-multiedit-match-and-next)
;; Insert marker at point
(define-key evil-insert-state-map (kbd "s-d") 'evil-multiedit-toggle-marker-here)

;; Same as M-d but in reverse.
(define-key evil-normal-state-map (kbd "s-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "s-D") 'evil-multiedit-match-and-prev)

;; OPTIONAL: If you prefer to grab symbols rather than words, use
;; `evil-multiedit-match-symbol-and-next` (or prev).

;; Restore the last group of multiedit regions.
(define-key evil-visual-state-map (kbd "C-s-D") 'evil-multiedit-restore)

;; RET will toggle the region under the cursor
;; (define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ...and in visual mode, RET will disable all fields outside the selected region
;; (define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; For moving between edit regions
;; (define-key evil-multiedit-normal-state-map (kbd "C-n") 'evil-multiedit-next)
;; (define-key evil-multiedit-normal-state-map (kbd "C-p") 'evil-multiedit-prev)
;; (define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
;; (define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)

;; Ex command that allows you to invoke evil-multiedit with a regular expression, e.g.
(evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)
; https://github.com/zilongshanren/emacs.d/blob/ef9ad86d68efc71978f158912584d6afd0c4c400/lisp/init-evil.el

(provide 'init-evil)

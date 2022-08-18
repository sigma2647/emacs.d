(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"
  )

  (rune/leader-keys
    "t"  '(:ignore t :which-key "Toggles")
    "tt" '(jb-hydra-theme-switcher/body :which-key "Change Theme")
    "e"  '(treemacs :which-key "tree")
    "fc" '(counsel-load-theme :which-key "Choose Theme")
    "fr" '(counsel-recentf :which-key "Recent File")
    "ff" '(find-file :which-key "Find File")
    "pc" '(eval-buffer :which-key "Packer Compile"))


  (general-define-key
   :states	'(normal motion visual)
   :keymaps	'override
   :prefix "SPC"
   "/" '(swiper :which-key "swiper")
   "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
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
  :states '(normal)
  "S" 'save-buffer
  "H" 'beginning-of-line
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
  ("1" (jib/load-theme 'doom-one) "one")
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


; https://github.com/zilongshanren/emacs.d/blob/ef9ad86d68efc71978f158912584d6afd0c4c400/lisp/init-evil.el
(provide 'init-evil)

(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC"
  )

  (rune/leader-keys
    "t"  '(:ignore t :which-key "Toggles")
    "fc" '(counsel-load-theme :which-key "Choose Theme")
    "fr" '(counsel-recentf :which-key "Recent File")
    "ff" '(find-file :which-key "Find File")
    "pc" '(eval-buffer :which-key "Packer Compile")
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
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

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





; https://github.com/zilongshanren/emacs.d/blob/ef9ad86d68efc71978f158912584d6afd0c4c400/lisp/init-evil.el
(provide 'init-evil)

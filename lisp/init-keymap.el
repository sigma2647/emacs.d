

(defalias 'yes-or-no-p 'y-or-n-p)

;使用esc取消执行指令
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)



(provide 'init-keymap)

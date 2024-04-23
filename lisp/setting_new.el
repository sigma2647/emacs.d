(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq custom-file (locate-user-emacs-file "custom.el"))


(set-frame-size (selected-frame) 850 760 'pixelwise)
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

(line-number-mode)
(column-number-mode)
(display-time-mode 1)
(size-indication-mode 0)

(provide 'setting_new)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

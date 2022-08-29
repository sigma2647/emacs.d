(font-lock-add-keywords 'markdown-mode
            '(("^ *\\([-]\\) "
            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

; (evil-define-key 'motion evil-markdown-mode-map
;        ;; (kbd (concat "g" .left)) 'markdown-up-heading
;        ;; (kbd (concat "g" .right)) (lambda () (interactive) (markdown-next-heading))
;        ;; (kbd (concat "g" .up)) 'markdown-backward-same-level
;        ;; (kbd (concat "g" .down)) 'markdown-forward-same-level)
;        (kbd (concat "g" .left)) 'markdown-up-heading
;        (kbd (concat "g" .right)) (lambda () (interactive) (markdown-next-heading))
;        (kbd (concat "g" .up)) 'markdown-backward-same-level
;        (kbd (concat "g" .down)) 'markdown-forward-same-level)



(provide 'init-markdown)

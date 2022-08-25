(font-lock-add-keywords 'markdown-mode
            '(("^ *\\([-]\\) "
            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(provide 'init-markdown)

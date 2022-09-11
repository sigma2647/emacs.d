(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :hook (markdown-mode . visual-line-mode)
  :init (setq markdown-command "multimarkdown")
  :custom
  (markdown-header-scaling               t)
  (markdown-enable-wiki-links            t)
  (markdown-italic-underscore            t)
  (markdown-asymmetric-header            t)
  (markdown-gfm-uppercase-checkbox       t)
  (markdown-enable-math                  t)
  (markdown-fontify-code-blocks-natively t))

(add-hook 'markdown-mode-hook  (lambda ()
                            (setq prettify-symbols-alist
                                  '(("lambda" . ?λ)
                                    (":PROPERTIES:" . ?)
                                    (":ID:" . ?)
                                    (":END:" . ?)
                                    ("#+TITLE:" . ?)
                                    ("#+AUTHOR:" . ?)
                                    ("``` py" . ?🐍)
                                    ("```" . ?)
                                    ("#+END_QUOTE" . ?)
                                    ("#+RESULTS:" . ?)
                                    ("[ ]" . ?)
                                    ("[-]" . ?)
                                    ("[X]" . ?)
                                    ("[#A]" . ?🅐)
                                    ("[#B]" . ?🅑)
                                    ("[#C]" . ?🅒)))
                            (prettify-symbols-mode)))


(font-lock-add-keywords 'markdown-mode
            '(("^ *\\([-]\\) "
            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(font-lock-add-keywords 'markdown-mode
            '(("^ *\\([*]\\) "
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

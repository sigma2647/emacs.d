(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-delay 0.5)
  :init
  (setq lsp-ui-doc-enable t
        lsp-ui-imenu-enable t
        lsp-ui-doc-include-signature t
        lsp-ui-doc-position 'at-point
        lsp-eldoc-enable-hover t ;Disable eldoc displays in minibuffer
        ))


(provide 'init-prog)

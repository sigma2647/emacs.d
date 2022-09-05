; ┌─────────┐
; │ setting │
; └─────────┘


; 设置logo
(defcustom centaur-logo (expand-file-name
                         (if (display-graphic-p) "~/.emacs.d/dashboard/logo.png" "~/.emacs.d/dashboard/banner.txt")
                         user-emacs-directory)
  "Set Centaur logo. nil means official logo."
  :group 'centaur
  :type 'string)



(provide 'init-startup)


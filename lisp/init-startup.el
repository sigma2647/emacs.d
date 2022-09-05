; ┌─────────┐
; │ setting │
; └─────────┘


(defcustom centaur-logo (expand-file-name
                         (if (display-graphic-p) "~/.emacs.d/dashboard/eva.png" "banner.txt")
                         user-emacs-directory)
  "Set Centaur logo. nil means official logo."
  :group 'centaur
  :type 'string)



(provide 'init-startup)


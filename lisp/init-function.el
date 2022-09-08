(defun my/frame-recenter (&optional frame)
  "Center FRAME on the screen.
FRAME can be a frame name, a terminal name, or a frame.
If FRAME is omitted or nil, use currently selected frame."
  (interactive)
  (unless (eq 'maximised (frame-parameter nil 'fullscreen))
    (modify-frame-parameters
     frame '((user-position . t) (top . 0.5) (left . 0.5)))))

(defun set-font-en(english font-size)
  ;; English
  (set-face-attribute
   'default nil :font
   (format "%s:pixelsize=%d"  english font-size))

 )

(defun set-font-zh(chinese font-size)
  (dolist (charset '( han symbol cjk-misc bopomofo))
 ;; Chinese
   (set-fontset-font
    (frame-parameter nil 'font) charset
    (font-spec :family chinese :size font-size))))

(provide 'init-function)

(defun guiconfig ()
  (if (display-graphic-p)
      (progn
	(menu-bar-mode -1)	;disable menu bar
	(tool-bar-mode -1)	;disable tool bar
	(scroll-bar-mode -1))))

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


(defun your-dnd-handler (url _action)
  (if
      (or (eq major-mode 'org-mode) (when (derived-mode-p 'org-mode))) 
      (insert (concat "[[file+sys:"  (substring (decode-coding-string (url-unhex-string url) 'utf-8) 5 nil)"]]"))
    (dired (substring (decode-coding-string (url-unhex-string url) 'utf-8) 5 nil))
    ))

(setq dnd-protocol-alist
      '(("" . your-dnd-handler)))
(provide 'init-function)

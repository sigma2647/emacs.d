(defun efs/org-mode-setup ()
  (org-indent-mode))
  ; (variable-pitch-mode 1)
  ; (visual-line-mode 1))

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

(defun +org/dwim-at-point ()
  "Do-what-I-mean at point.
If on a:
- checkbox list item or todo heading: toggle it.
- clock: update its time.
- headline: toggle latex fragments and inline images underneath.
- footnote reference: jump to the footnote's definition
- footnote definition: jump to the first reference of this footnote
- table-row or a TBLFM: recalculate the table's formulas
- table-cell: clear it and go into insert mode. If this is a formula cell,
  recaluclate it instead.
- babel-call: execute the source block
- statistics-cookie: update it.
- latex fragment: toggle it.
- link: follow it
- otherwise, refresh all inline images in current tree."
  (interactive)
  (let* ((context (org-element-context))
         (type (org-element-type context)))
    ;; skip over unimportant contexts
    (while (and context (memq type '(verbatim code bold italic underline strike-through subscript superscript)))
      (setq context (org-element-property :parent context)
            type (org-element-type context)))
    (pcase type
      (`headline
       (cond ((and (fboundp 'toc-org-insert-toc)
                   (member "TOC" (org-get-tags)))
              (toc-org-insert-toc)
              (message "Updating table of contents"))
             ((string= "ARCHIVE" (car-safe (org-get-tags)))
              (org-force-cycle-archived))
             ((or (org-element-property :todo-type context)
                  (org-element-property :scheduled context))
              (org-todo
               (if (eq (org-element-property :todo-type context) 'done)
                   (or (car (+org-get-todo-keywords-for (org-element-property :todo-keyword context)))
                       'todo)
                 'done)))
             (t
              (+org--refresh-inline-images-in-subtree)
              (org-clear-latex-preview)
              (org-latex-preview '(4)))))

      (`clock (org-clock-update-time-maybe))

      (`footnote-reference
       (org-footnote-goto-definition (org-element-property :label context)))

      (`footnote-definition
       (org-footnote-goto-previous-reference (org-element-property :label context)))

      ((or `planning `timestamp)
       (org-follow-timestamp-link))

      ((or `table `table-row)
       (if (org-at-TBLFM-p)
           (org-table-calc-current-TBLFM)
         (ignore-errors
           (save-excursion
             (goto-char (org-element-property :contents-begin context))
             (org-call-with-arg 'org-table-recalculate (or arg t))))))

      (`table-cell
       (org-table-blank-field)
       (org-table-recalculate)
       (when (and (string-empty-p (string-trim (org-table-get-field)))
                  (bound-and-true-p evil-local-mode))
         (evil-change-state 'insert)))

      (`babel-call
       (org-babel-lob-execute-maybe))

      (`statistics-cookie
       (save-excursion (org-update-statistics-cookies nil)))

      ((or `src-block `inline-src-block)
       (org-babel-execute-src-block))

      ((or `latex-fragment `latex-environment)
       (org-latex-preview))

      (`link
       (let* ((lineage (org-element-lineage context '(link) t))
              (path (org-element-property :path lineage)))
         (if (or (equal (org-element-property :type lineage) "img")
                 (and path (image-type-from-file-name path)))
             (+org--refresh-inline-images-in-subtree)
           (org-open-at-point))))

      ((guard (org-element-property :checkbox (org-element-lineage context '(item) t)))
       (let ((match (and (org-at-item-checkbox-p) (match-string 1))))
         (org-toggle-checkbox (if (equal match "[ ]") '(16)))))

      (_ (+org--refresh-inline-images-in-subtree)))))

;;;###autoload
(defun +rest/dwim-at-point ()
  "TODO"
  (interactive)
  (when (+rest-request-at-point-p)
    (restclient-http-send-current-stay-in-window)))

(defvar +nav-flash-exclude-commands
  '(mouse-set-point mouse-drag-region evil-mouse-drag-region +org/dwim-at-point
    org-find-file org-find-file-at-mouse)
  "A list of commands that should not trigger nav-flash.")



(setq dnd-protocol-alist
      '(("" . your-dnd-handler)))

;; (defun vi-search-replace (arg)
;;   "Search and optionally replace a regular expression.
;; ARG has one of the following forms:

;; REGEXP
;;   a simple `re-search-forward'
;; REGEXP/TO-STRING
;;   replace the next occurence
;; REGEXP/TO-STRING/g
;;   replace all remaining occurences using `replace-regexp'"
;;   (interactive "sregexp/replace: ")
;;   (let ((args (split-string arg "/")))
;;     (cond ((= (length args) 1)
;; 	   (apply 're-search-forward args))
;; 	  ((or (= (length args) 2)
;; 	       (string= (third args) ""))
;; 	   (when (re-search-forward (first args))
;; 	     (replace-match (second args))))
;; 	  ((and (= (length args) 3)
;; 		(string= (third args) "g"))
;; 	   (replace-regexp (first args) (second args)))
;; 	  (t (error "Please provide a string of the form REGEXP/TO-STRING/g")))))
(defun kdm/html2org-clipboard ()
  "Convert clipboard contents from HTML to Org and then paste (yank)."
  (interactive)
  (setq cmd "osascript -e 'the clipboard as \"HTML\"' | perl -ne 'print chr foreach unpack(\"C*\",pack(\"H*\",substr($_,11,-3)))' | pandoc -f html -t json | pandoc -f json -t org")
  (kill-new (shell-command-to-string cmd))
  (yank))

;; cmd-c
;; check clip


(defun me-org-mode-remove-stars ()
  (font-lock-add-keywords
   nil
   '(("^\\*+ "
      (0
       (prog1 nil
         (put-text-property (match-beginning 0) (match-end 0)
                            'invisible t)))))))

; (add-hook 'org-mode-hook #'me-org-mode-remove-stars)
;; 您只需将变量org-hide-leading-stars设置为t，然后它将隐藏标题中的所有前导星号。您甚至可以使用org-mode指令为特定文件启用或禁用它。有关更多详细信息，请参阅内置文档(C-h v  org-hide-leading-stars)和info pages。(我个人使用它)
;; 附注:还有另一种方法可以做到这一点--通过org-ident-mode，但我还没有尝试过。

(provide 'init-function)


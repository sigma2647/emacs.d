
; ┌─────────┐
; │ PACKAGE │
; └─────────┘

(use-package ivy
  :diminish
  :init(which-key-mode)
  :bind (("C-s" . swiper)
		 :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

(use-package prescient
  :config
  (setq-default history-length 1000)
  (setq-default prescient-history-length 1000) ;; More prescient history
  (prescient-persist-mode +1))

;; Use `prescient' for Ivy menus.
(use-package ivy-prescient
  :after ivy
  :config
  ;; don't prescient sort these commands
  (dolist (command '(org-ql-view counsel-find-file fontaine-set-preset))
    (setq ivy-prescient-sort-commands (append ivy-prescient-sort-commands (list command))))
  (ivy-prescient-mode +1))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))


(setq display-time-default-load-average nil)


(use-package hide-mode-line
  :commands (hide-mode-line-mode))

(use-package doom-modeline
  :config
  (doom-modeline-mode)
  (setq doom-modeline-buffer-file-name-style 'relative-from-project ;; Just show file name (no path)
        doom-modeline-enable-word-count nil
        doom-modeline-buffer-encoding nil
        doom-modeline-icon t ;; Enable/disable all icons
        doom-modeline-modal-icon t ;; Icon for Evil mode
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon nil
        doom-modeline-bar-width 3))

;---------

(use-package doom-themes)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))



(use-package which-key
  :init(which-key-mode)
  :diminish which-key-mode
  :config
    (setq which-key-idle-delay 0.1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("s-p" . counsel-M-x)
	 ("C-x b" . counsel-iubffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

;; (use-package helpful
;;   :ensure t
;;   :custom
;;   (counsel-describe-function-function #'helpful-callable)
;;   ;; (counsel-describe-variable-function #'helpful-variable)
;;   :bind
;;   ([remap describe-function] . counsel-describe-function)
;;   ([remap describe-command] . helpful-command)
;;   ([remap describe-variable] . counsel-describe-varibale)
;;   ([remap describe-key] . helpful-key))

;

; (dolist (face '((org-level-1 . 1.2)
;                   (org-level-2 . 1.1)
;                   (org-level-3 . 1.05)
;                   (org-level-4 . 1.0)
;                   (org-level-5 . 1.1)
;                   (org-level-6 . 1.1)
;                   (org-level-7 . 1.1)
;                   (org-level-8 . 1.1)))
;     (set-face-attribute (car face) nil :font "JetBrains Mono" :weight 'regular :height (cdr face)))



(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/quant_alpha")
    (setq projectile-project-search-path '("~/quant_alpha")))
  (setq projectile-switch-project-action #'projectile-dired))



(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;(use-package evil-magit
;  :after magit)





(use-package anaconda-mode)
(use-package auto-complete)





;
(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

; (use-package org-tempo)

;; (use-package lsp-mode
;;   ;; :commands (lsp lsp-deferred)
;;   :hook ('prog-mode . 'lsp-mode)
;;   ;; :init
;;   ;; (setq lsp-keymap-prefix "C-c l")
;;   :config
;;   (lsp-enable-which-key-integration t))

(use-package lsp-mode
  :ensure t
  :hook ('prog-mode . 'lsp-mode))


(use-package lsp-ui)


  (use-package typescript-mode
    :mode "\\.ts\\'"
    :hook (typescript-mode . lsp-deferred)
    :config
    (setq typescript-indent-level 2))


(use-package python-mode
  :ensure t
  :hook (python-mode . lsp-deferred)
  :custom
  ;; NOTE: Set these if Python 3 is called "python3" on your system!
  (python-shell-interpreter "python3")
  ;; (dap-python-executable "python3")
  (dap-python-debugger 'debugpy)
  :config
  (require 'dap-python))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package company
  ;; :after lsp-mode
  :defer 2 ; 延迟启动
  ;; :hook (lsp-mode . company-mode)
  :hook (after-init . global-company-mode)
  :init (setq company-tooltip-align-annotations t company-idle-delay 0 company-echo-delay 0
              company-minimum-prefix-length 2 company-require-match nil company-dabbrev-ignore-case
              nil company-dabbrev-downcase nil)
  :bind
  (:map company-active-map
        ("C-n"    . #'company-select-next)
        ("C-p"    . #'company-select-previous)
        ("<tab>"  . #'company-complete-selection))
  (:map lsp-mode-map
        ("C-n"    . #'company-select-next)
        ("C-p"    . #'company-select-previous)
        ("<tab>"  . #'company-indent-or-complete-common)))


(use-package gcmh
  :diminish gcmh-mode
  :config
  (setq gcmh-idle-delay 5
        gcmh-high-cons-threshold (* 16 1024 1024))  ; 16mb
  (gcmh-mode 1))

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-percentage 0.1))) ;; Default value for `gc-cons-percentage'

(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs ready in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;(use-package yasnippet
;  :diminish yas-minor-mode
;  :defer 5
;  :config
;  (setq yas-snippet-dirs (list (expand-file-name "snippets" jib/emacs-stuff)))
;  (yas-global-mode 1)) ;; or M-x yas-reload-all if you've started YASnippet already.

  
(use-package visual-fill-column
  :defer t
  :config
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t))

; (use-package writeroom-mode
;   :defer t
;   :config
;   (setq writeroom-maximize-window nil
;         writeroom-header-line "" ;; Makes sure we have a header line, that's blank
;         writeroom-mode-line t
;         writeroom-global-effects nil) ;; No need to have Writeroom do any of that silly stuff
;   (setq writeroom-width 100))

; (use-package writeroom-mode
;   :hook (after-init . global-writeroom-mode)
;   :config
;   (setq split-width-threshold 120
;
;         writeroom-width 128
;         writeroom-bottom-divider-width 0
;         writeroom-fringes-outside-margins t
;         writeroom-fullscreen-effect nil
;         writeroom-major-modes '(text-mode prog-mode conf-mode special-mode Info-mode dired-mode)
;         writeroom-major-modes-exceptions '(process-menu-mode proced-mode)
;         writeroom-maximize-window nil
;         writeroom-mode-line t
;         writeroom-mode-line-toggle-position 'mode-line-format))

; (global-writeroom-mode 1)
; (add-hook 'org-agenda-mode-hook (lambda() (writeroom-mode)))
; (add-hook 'org-agenda-mode-hook (lambda() (writeroom-mode)))
; (add-hook 'telega-root-mode-hook (lambda () (writeroom-mode 1)))
; (add-hook 'java-mode-hook (lambda () (writeroom-mode nil)))
; (add-hook 'python-mode-hook (lambda () (writeroom-mode nil)))


(use-package olivetti
  :diminish
  :bind
  (:map global-map
	("<f8>" . olivetti-mode))
  :init
  (setq olivetti-body-width 0.618)
  ;; (defun xs-toggle-olivetti-for-org ()
  ;;   "if current buffer is org and only one visible buffer enable olivetti mode"
  ;;   (if (and (eq (buffer-local-value 'major-mode (current-buffer)) 'org-mode)
  ;; 	     (or (eq (length (window-list nil nil nil)) 1)
  ;; 		 (window-at-side-p (frame-first-window) 'right))) ;; frame-first-window 的 mode 是 org-mode 并且没有右边 window
  ;; 	(olivetti-mode 1)
  ;;     (olivetti-mode 0)
  ;;     (when (eq (buffer-local-value 'major-mode (current-buffer)) 'org-mode)
  ;;       (visual-line-mode 1))))
  ;; (add-hook 'org-mode-hook #'xs-toggle-olivetti-for-org)
  ;; (add-hook 'window-configuration-change-hook #'xs-toggle-olivetti-for-org)
  )


(use-package centered-cursor-mode
  :demand
  ;:diminish centered-cursor-mode
  :config
  ;; (global-centered-cursor-mode)
  )

;; (use-package pyvenv
;;   :defer t
;;   :config
;;   (pyvenv-mode 1)
;;   :init
;;   (setenv "WORKON_HOME"))

;
; ;; Automatically set the virtual environment when entering a directory
; (use-package auto-virtualenv
;   :defer 2
;   :config
;   (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv))
;




;; (use-package treemacs
;;   :ensure t
;;   :defer t
;;   :init
;;   (with-eval-after-load 'winum
;;     (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
;;   :config
;;   (progn
;;     (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
;;           treemacs-deferred-git-apply-delay        0.5
;;           treemacs-directory-name-transformer      #'identity
;;           treemacs-display-in-side-window          t
;;           treemacs-eldoc-display                   'simple
;;           treemacs-file-event-delay                5000
;;           treemacs-file-extension-regex            treemacs-last-period-regex-value
;;           treemacs-file-follow-delay               0.2
;;           treemacs-file-name-transformer           #'identity
;;           treemacs-follow-after-init               t
;;           treemacs-expand-after-init               t
;;           treemacs-find-workspace-method           'find-for-file-or-pick-first
;;           treemacs-git-command-pipe                ""
;;           treemacs-goto-tag-strategy               'refetch-index
;;           treemacs-header-scroll-indicators        '(nil . "^^^^^^")
;;           treemacs-hide-dot-git-directory          t
;;           treemacs-indentation                     2
;;           treemacs-indentation-string              " "
;;           treemacs-is-never-other-window           nil
;;           treemacs-max-git-entries                 5000
;;           treemacs-missing-project-action          'ask
;;           treemacs-move-forward-on-expand          nil
;;           treemacs-no-png-images                   nil
;;           treemacs-no-delete-other-windows         t
;;           treemacs-project-follow-cleanup          nil
;;           treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
;;           treemacs-position                        'left
;;           treemacs-read-string-input               'from-child-frame
;;           treemacs-recenter-distance               0.1
;;           treemacs-recenter-after-file-follow      nil
;; 	  treemacs-filewatch-mode                  t
;; 	  treemacs-file-event-delay                1000
;;           treemacs-recenter-after-tag-follow       nil
;;           treemacs-recenter-after-project-jump     'always
;;           treemacs-recenter-after-project-expand   'on-distance
;;           treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
;;           treemacs-show-cursor                     nil
;;           treemacs-show-hidden-files               t
;;           treemacs-silent-filewatch                nil
;;           treemacs-silent-refresh                  nil
;;           treemacs-sorting                         'alphabetic-asc
;;           treemacs-select-when-already-in-treemacs 'move-back
;;           treemacs-space-between-root-nodes        t
;;           treemacs-tag-follow-cleanup              t
;;           treemacs-tag-follow-delay                1.5
;;           treemacs-text-scale                      nil
;;           treemacs-user-mode-line-format           nil
;;           treemacs-user-header-line-format         nil
;;           treemacs-wide-toggle-width               70
;;           treemacs-width                           35
;;           treemacs-width-increment                 1
;;           treemacs-width-is-initially-locked       t
;;           treemacs-workspace-switch-cleanup        nil)

;;     ;; The default width and height of the icons is 22 pixels. If you are
;;     ;; using a Hi-DPI display, uncomment this to double the icon size.
;;     ;;(treemacs-resize-icons 44)

;;     (treemacs-follow-mode t)
;;     (treemacs-filewatch-mode t)
;;     (treemacs-fringe-indicator-mode 'always)
;;     (when treemacs-python-executable
;;       (treemacs-git-commit-diff-mode t))

;;     (pcase (cons (not (null (executable-find "git")))
;;                  (not (null treemacs-python-executable)))
;;       (`(t . t)
;;        (treemacs-git-mode 'deferred))
;;       (`(t . _)
;;        (treemacs-git-mode 'simple)))

;;     (treemacs-hide-gitignored-files-mode nil))
;;   :bind
;;   (:map global-map
;;         ("M-0"       . treemacs-select-window)
;;         ("C-x t 1"   . treemacs-delete-other-windows)
;;         ("C-x t t"   . treemacs)
;;         ("C-x t d"   . treemacs-select-directory)
;;         ("C-x t B"   . treemacs-bookmark)
;;         ("C-x t C-t" . treemacs-find-file)
;;         ("C-x t M-t" . treemacs-find-tag)))
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                5000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
  :after (treemacs persp-mode) ;;or perspective vs. persp-mode
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

(use-package treemacs-tab-bar ;;treemacs-tab-bar if you use tab-bar-mode
  :after (treemacs)
  :ensure t
  :config (treemacs-set-scope-type 'Tabs))


(use-package ivy-posframe
  :ensure t
  :init
  (ivy-posframe-mode 1)
  :custom
  (ivy-posframe-parameters
   '((left-fringe . 10)
     (right-fringe . 10))
   )

  (ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center))))


(use-package jupyter
    :defer t
    :init
    (setq org-babel-default-header-args:jupyter-python '((:async . "yes")
                                                         (:session . "py"))
          org-babel-default-header-args:jupyter-R '((:async . "yes"))))

;; evilcomment
;
; (use-package eaf
;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
;   :custom
;   ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
;   (eaf-browser-continue-where-left-off t)
;   (eaf-browser-enable-adblocker t)
;   (browse-url-browser-function 'eaf-open-browser)
;   :config
;   (defalias 'browse-web #'eaf-open-browser)
;   (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
;   (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
;   (eaf-bind-key take_photo "p" eaf-camera-keybinding)
;   (eaf-bind-key nil "M-q" eaf-browser-keybinding)) ;; unbind, see more in the Wiki
;
; (add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-application-framework/")
;
; (require 'eaf-browser)
; (require 'eaf)
; (require 'eaf-pdf-viewer)
(use-package valign)
(add-hook 'org-mode-hook #'valign-mode)
(add-hook 'markdown-mode-hook #'valign-mode)
(setq valign-fancy-bar t)


(use-package highlight-indent-guides
  :hook (prog-mode . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method 'character)
  (highlight-indentation-blank-lines t)
  ; (highlight-indent-guides-auto-enabled nil)
  :config
  (set-face-background 'highlight-indent-guides-odd-face "color-233")
  (set-face-background 'highlight-indent-guides-even-face "color-233")
  (set-face-foreground 'highlight-indent-guides-character-face "color-233"))

(add-hook 'python-mode-hook 'highlight-indent-guides-mode)

(use-package lpy)
;; (use-package )
(use-package nano-modeline)


;; tmux
;; (use-package perspeen
;;   :ensure t
;;   :init
;;   (setq persqeen-use-tab t)
;;   ;; (setq perspeen-keymap-prefix (kbd "`"))
;;   (setq perspeen-keymap-prefix [C-tab])
;;   :config
;;   (perspeen-mode))


(provide 'init-packages)


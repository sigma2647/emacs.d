(require 'package)

(setq package-archives '(
                         ;("melpa" . "https://melpa.org/packages/")
                         ("melpa" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/melpa/")
                         ("org" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/org/")
                         ("gnu" . "https://mirrors.sjtug.sjtu.edu.cn/emacs-elpa/gnu/")

                         ; ("elpa" . "https://elpa.gnu.org/packages/")))

                         ; 163 国内源
                         ; ("melpa" . "https://melpa.org/packages/")
                         ; ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ; ("melpa" . "https://mirrors.163.com/elpa/melpa/")
                         ; ("melpa-stable" . "https://mirrors.163.com/elpa/stable-melpa/"))))
))

;; 刷新软件索引
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t) ;确保所有包都被安装

;; 将lisp目录放到加载路径的前面以加快启动速度
(let ((dir (locate-user-emacs-file "lisp")))
  (add-to-list 'load-path (file-name-as-directory dir)))


;; 加载各模块化配置
;; 不要在`*message*'缓冲区显示加载模块化配置的信息
(with-temp-message ""


  ; (require 'init-system)
  (require 'init-options)
  (require 'init-startup)
  (require 'init-elpa)
  (require 'init-dashboard)
  (require 'init-packages) ;包含补全
  (require 'init-ui)
  (require 'init-prog)
  (require 'init-evil)
  (require 'init-function)
  (require 'init-markdown)
  (require 'init-org)
  (require 'core-keymap)
  (require 'init-py)


  (require 'setting_new)
  (require 'packages_new)

  )
  ; ┌───────┐
  ; │ theme │
  ; └───────┘

  ;(load-theme 'doom-ayu-dark t)

  (load-theme 'doom-sourcerer t)

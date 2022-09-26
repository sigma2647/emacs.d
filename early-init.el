;; 增加IO性能
;; (setq read-process-output-max (* 10240 1024))
;; (setq process-adaptive-read-buffering nil)
(setq gc-cons-threshold most-positive-fixnum)
(require 'cl-lib)


(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp/")))
(setq default-directory "~/")


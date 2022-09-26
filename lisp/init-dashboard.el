;; init-dashboard.el --- Initialize dashboard configurations.	-*- lexical-binding: t -*-

;; Copyright (C) 2018-2022 Vincent Zhang

;; Author: Vincent Zhang <seagle0128@gmail.com>
;; URL: https://github.com/seagle0128/.emacs.d

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;

;;; Commentary:
;;
;; Dashboard configurations.
;;

(use-package dashboard
 :ensure t
 :init
 (add-hook 'after-init-hook 'dashboard-refresh-buffer)
 ;; (add-hook dashboard-mode-hook 'my/dashboard-banner)
 (progn
   ;(setq dashboard-startup-banner "~/Downloads/IMG_D39C1E9B3D4A-1.jpeg")
   ;(setq dashboard-startup-banner "~/Downloads/eva.png")

   ; (setq dashboard-startup-banner
   ; 	  (when (display-graphic-p) "~/.emacs.d/dashboard/eva.png"))

   (setq dashboard-startup-banner (or centaur-logo 'official))


   (setq dashboard-banner-logo-title "HI Emacs")
   (setq dashboard-set-heading-icons t)
   (setq dashboard-set-file-icons t)
   (setq dashboard-items '((recents . 5)
			    (projects . 5)))
   (setq dashboard-center-content t)
   (setq dashboard-image-banner-max-width 300)
   (setq dashboard-image-banner-max-height 300)
   (dashboard-setup-startup-hook)
   )

(setq initial-buffer-choice
			(lambda () (get-buffer "*dashbaord*")))


 :config

 (dashboard-setup-startup-hook))


(provide 'init-dashboard)

;; 
;;
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; 插件管理
(require 'init-packages)

;; 视觉层配置
(require 'init-ui)

;; 增强内置功能
(require 'init-better-defaults)

;; org模式相关的全部设定
(require 'init-org)

;; 存放使用编辑器接口产生的配置信息
(require 'custome)

;; 快捷键绑定
(require 'init-keybindings)

;; (require 'recentf)
;; (recentf-mode 1)
;; (setq recentf-max-menu-item 10)

;; 这个快捷键绑定可以用之后的插件 counsel 代替
;; (global-set-key (kbd "C-x C-r") 'recentf-open-files)



;; cl - Common Lisp Extension
;; (require 'cl)

;; (add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; (add-to-list my/packages 'monokai-theme)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (package-build shut-up epl git commander f dash s company hungry-delete swiper counsel smartparens js2-mode monokai-theme solarized-theme iedit expand-region evil org-pomodoro pallet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "Magenta")))))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 插件管理
(require 'init-packages)

;; 视觉层配置
(require 'init-ui)

;; 增强内置功能
(require 'init-better-defaults)

;; 存放使用编辑器接口产生的配置信息
;; (require 'custom)

;; 快捷键绑定
(require 'init-keybindings)

;; org模式相关的全部设定
(require 'init-org)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

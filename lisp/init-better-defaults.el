;;
;;
;; 关闭Emacs中的警告音
(setq ring-bell-function 'ignore)

;; 禁止Emacs自动生成备份文件 如init.el~
(setq make-backup-files nil)

;; 关闭Emacs自动保存文件
(setq auto-save-default nil)

;; 自动加载外部修改过的文件
(global-auto-revert-mode t)

;; 启用最近打开文件list;
(require 'recentf)
(recentf-mode t)
(setq recentf-max-menu-items 25)

;; 开启缩写替换;
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("XxX" "MyName")
					    ("XXxx" "MMMM")
					    ))

;; 输入 (y or n)
(fset 'yes-or-no-p 'y-or-n-p)

;; 选中一段文字之后输入一个字符会替换掉你选中部分的文字
(delete-selection-mode 1)

;; 启用自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;(add-hook 'emacs-lisp-mode-hook 'linum-mode)

;; 开启全局行号
(global-linum-mode 1)

;; 设置Emacs递归删除
(setq dired-recursive-deletes 'always)

;; 设置Emacs递归拷贝
(setq dired-recursive-copies 'always)

;; 设置Emacs重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; dired延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 启用 dired-x 可以让每一次进入Dired模式时，使用新的快捷键 C-x C-j 就可以进入当前文件夹的所在的路径;
(require 'dired-x)

;; 使当一个窗口（frame）中存在两个分屏 （window）时，将另一个分屏自动设置成拷贝地址的目标;
(setq dired-dwin-target 1)


(provide 'init-better-defaults)

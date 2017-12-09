;;
;;
;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;;
(electric-indent-mode -1)

;;
(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;
(global-set-key (kbd "C-x C-1") 'open-my-init-file)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 显示行号
(global-linum-mode 1)

;; 高亮当前行
(global-hl-line-mode 1)

;;将Emacs设置为开启默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 禁止Emacs自动生成备份文件 如init.el~
(setq make-backup-files nil)

;; 选中一段文字之后输入一个字符会替换掉你选中部分的文字
(delete-selection-mode 1)

;; 启用自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

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

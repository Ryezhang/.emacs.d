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

;; show-paren-mode 可以使鼠标在括号上是高亮其所匹配的另一半括号，然而我们想要光标 在括号内时就高亮包含内容的两个括号，使用下面的代码就可以做到这一点;
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
        (t (save-excursion
             (ignore-errors (backward-up-list))
             (funcall fn)))))

;; 启用自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;(add-hook 'emacs-lisp-mode-hook 'linum-mode)

;; 开启全局行号
(global-linum-mode 1)

(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

;; indent-region 可以帮我们重新缩进所选区域的代码，但是每一次都选中十分麻烦。
;; 使用下面的代码可以一次重新缩进全部缓冲区的代码
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indent selected region."))
      (progn
        (indent-buffer)
        (message "Indent buffer.")))))

;; 增强 Hippie Expand 的功能
(setq hippie-expand-try-function-list '(try-expand-debbrev
                                        try-expand-debbrev-all-buffers
                                        try-expand-debbrev-from-kill
                                        try-complete-file-name-partially
                                        try-complete-file-name
                                        try-expand-all-abbrevs
                                        try-expand-list
                                        try-expand-line
                                        try-complete-lisp-symbol-partially
                                        try-complete-lisp-symbol))

;; +: to create directory
;; C-x C-f: to create file
;; g: to refresh dired buffer
;; C: copy file
;; d: delete file
;; D: delete after confirm
;; R: rename files

;; 设置Emacs递归删除
(setq dired-recursive-deletes 'always)

;; 设置Emacs递归拷贝
(setq dired-recursive-copies 'always)

;; 设置Emacs重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; o启用 dired-x 可以让每一次进入Dired模式时，使用新的快捷键 C-x C-j 就可以进入当前文件夹的所在的路径;
(require 'dired-x)

;; 使当一个窗口（frame）中存在两个分屏 （window）时，将另一个分屏自动设置成拷贝地址的目标;
(setq dired-dwin-target 1)

;; 替换window下的换行符;
(defun hidden-dos-eol ()
  "Replace Dos eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; 配置 Occur Mode 使其默认搜索当前被选中的或者在光标下的字符串
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))

;; imenu可以显示当前buffer中的函数列表;


(provide 'init-better-defaults)

;;
;;
;; 打开init.el文件;
(global-set-key (kbd "C-c 1") 'open-my-init-file)

;; 打开最近打开的文件列表;
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; 跳转行号;
(global-set-key (kbd "C-x j") 'goto-line)

;; 对整个buffer标准缩紧;
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; Company 有时候补全功能并不是非常理想，这时就可以使用 Hippie Expand 来完成补全
(global-set-key (kbd "s-/") 'hippie-expand)

;; 跳转到function/variable/function-key定义文件;
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; swiper ivy绑定键
(global-set-key "\C-s" 'swiper)
;;(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)
(global-set-key (kbd "C-c p f") 'counsel-git)
(global-set-key (kbd "M-s i") 'counsel-imenu)

;; occur mode搜索绑定键;
(global-set-key (kbd "M-s o") 'occur-dwim)

;; iedit 是一个可以同时编辑多个区域的插件，它类似 Sublime Text 中的多光标编辑
;; 我们将其绑定快捷键以便更快捷的使用这个模式（ C-; 为默认快捷键）
(global-set-key (kbd "M-s e") 'iedit-mode)

(global-set-key (kbd "C-=") 'er/expand-region)

;; dired延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


(provide 'init-keybindings)

;;
;;

;; 将 C-w 来使其可以向后删除一个单词
(global-set-key (kbd "C-w") 'backward-kill-word)

;; iedit 是一个可以同时编辑多个区域的插件，它类似 Sublime Text 中的多光标编辑
;; 我们将其绑定快捷键以便更快捷的使用这个模式（ C-; 为默认快捷键）
(global-set-key (kbd "M-s e") 'iedit-mode)

;; 
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; Company 有时候补全功能并不是非常理想，这时就可以使用 Hippie Expand 来完成补全
(global-set-key (kbd "s-/") 'hippie-expand)



(provide 'init-keybindings)

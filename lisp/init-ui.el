;;
;;
;; 关闭文件滑动控件
(scroll-bar-mode -1)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 高亮当前行
(global-hl-line-mode 1)

;;将Emacs设置为开启默认全屏
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 每次打开编辑器时加载主题monokai
;;(load-theme 'monokai 1)
(load-theme 'solarized-light t)


(provide 'init-ui)

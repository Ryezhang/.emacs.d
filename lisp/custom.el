;;
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(evil-leader/leader "SPC")
 '(evil-want-C-u-scroll t)
 '(package-selected-packages
   (quote
    (company-anaconda use-package evil-leader exec-path-from-shell lua-mode mwe-log-commands popwin powerline-evil reveal-in-osx-finder undo-tree window-numbering pallet package-build shut-up epl git commander f dash s company hungry-delete swiper counsel smartparens js2-mode monokai-theme solarized-theme iedit expand-region evil org-pomodoro))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "Magenta")))))

(defun js2-imenu-make-index ()
  (interactive)
  (save-excursion
    ;; (setq imenu-generic-expression '((nil "describe\\(\"\\(.+\\)\"" 1)))
    (imenu--generic-function '(("describe" "\\s-*describe\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("it" "\\s-*it\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("test" "\\s-*test\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("before" "\\s-*before\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("after" "\\s-*after\\s-*(\\s-*[\"']\\(.+\\)[\"']\\s-*,.*" 1)
			       ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			       ("Function" "^var[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*()[ \t]*{" 1)
			       ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*:[ \t]*function[ \t]*(" 1)
			       ("Task" "[. \t]task([ \t]*['\"]\\([^'\"]+\\)" 1)))))
(add-hook 'js2-mode-hook
	  (lambda ()
	    (setq imenu-create-index-function 'js2-imenu-make-index)))

(global-set-key (kbd "M-s i") 'counsel-imenu)

;; 设置一个模板 待办事项的优先级还有触发键
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
         "* TODO [#B] %?\n  %i\n"
         :empty-lines 1)))

;; 在不同系统中的换行符，例如在 DOS 系统下的 \r(^M) 换行符， 这让我们有时候在 Unix 系统中很是头疼，因为它的存在会使版本控制误以为整行的代码都 被修改过而造成不必要的麻烦;
;; 隐藏这个换行符
(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (unless buffer-display-table
    (setq buffer-display-table (make-display-table)))
  (aset buffer-display-table ?\^M []))

;; 定义函数将此换行符删除
(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; 给 org-pomodoro 增加桌面通知功能
;; 定义通知函数
(defun notify-osx (title message)   
	(call-process "terminal-notifier"		 
		nil 0 nil		 
		"-group" "Emacs"		 
		"-title" title		 
		"-sender" "org.gnu.Emacs"		 
		"-message" message		 
		"-activate" "oeg.gnu.Emacs"))

;; 定制通知内容
(add-hook 'org-pomodoro-finished-hook
	(lambda ()
		(notify-osx "Pomodoro completed!" "Time for a break.")))
(add-hook 'org-pomodoro-break-finished-hook
	(lambda ()
        (notify-osx "Pomodoro Short Break Finished" "Ready for Another?")))
(add-hook 'org-pomodoro-long-break-finished-hook
	(lambda ()
		(notify-osx "Pomodoro Long Break Finished" "Ready for Another?")))
(add-hook 'org-pomodoro-killed-hook    
	(lambda ()
		(notify-osx "Pomodoro Killed" "One does not simply kill a pomodoro!")))


(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
(add-hook 'objc-mode-hook 'rtags-start-process-unless-running)

(provide 'custom)

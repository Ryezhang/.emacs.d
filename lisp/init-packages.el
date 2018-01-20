;; cl - Common Lisp Extension
(require 'cl)

;; ;; (let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
;; ;;                     (not (gnutls-available-p))))
;; ;;        (url (concat (if no-ssl "http" "https") "://stable.melpa.org/packages/")))
;; ;;   (add-to-list 'package-archives (cons "melpa" url) t))
;; (when (>= emacs-major-version 24)
;;   ;; For important compatibility libraries like cl-lib
;;   ;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
;;   ;;(require 'package) ;; You might already have this line
;;   ;;(package-initialize) ;; You might already have this line
;;   (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
;; 			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; ;; Add Packages
;; (defvar my/packages '(
;; 		      ;; --- Auto-completion ---
;; 		      company
;; 		      ;; --- Better Editor ---
;; 		      hungry-delete
;; 		      ;;smex
;; 		      swiper
;; 		      counsel
;; 		      smartparens
;; 		      ;; --- Major Mode ---
;; 		      js2-mode
;; 		      lua-mode
;; 		      ;; --- Minor Mode ---
;; 		      ;; nodejs-repl
;; 		      exec-path-from-shell
;; 		      popwin
;; 		      reveal-in-osx-finder  ;; 在osx-finder中打开文件目录;
;; 		      ;; --- Themes ---
;; 		      monokai-theme
;; 		      solarized-theme
;; 		      iedit  ;; 同时编辑多处;
;; 		      expand-region  ;; 扩展选中区域;
;; 		      evil
;; 		      evil-leader
;; 		      window-numbering
;; 		      powerline-evil
;; 		      org-pomodoro
;; 		      pallet
;; 		      mwe-log-commands
;; 		      ) "Default packages")

;; (setq package-selected-packages my/packages)

;; (defun my/packages-installed-p ()
;;   (loop for pkg in my/packages
;; 	when (not (package-installed-p pkg)) do (return nil)
;; 	finally (return nil)))

;; (unless (my/packages-installed-p)
;;   (message "%s" "Refreshing package database...")
;;   (package-refresh-contents)
;;   (dolist (pkg my/packages)
;;     (when (not (package-installed-p pkg))
;;       (package-install pkg))))

(setq auto-mode-alist
      (append
       ;; File name (within directory) starts with a dot.
       '(("/\\.[^/]*\\'" . fundamental-mode)
	 ;; File name has no dot.
	 ("/[^\\./]*\\'" . fundamental-mode)
	 ;; File name ends in ‘.C’.
	 ("\\.C\\'" . c++-mode)
	 ("\\.js\\'". js2-mode))
       auto-mode-alist))

;; let emacs could find executable on OSX
;; (when (memq systom-type '(mac ns))
;;  (exec-path-from-shell-intialize))

;; 使用company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; 使用hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; 启动Emacs自动运行Smex
;; (require 'smex)   ;; Not needed if you use package.el
;; (smex-initialize) ;; Can be omitted. This might cause a (minimal) delay when Smex is auto-initialized on its first run.

;; Smex绑定执行键
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; 开启swiper ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; 开启smartparens
(smartparens-global-mode t)
;; (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)

;; 在 Emacs Lisp 中'不作补全
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)

;; 开启popwin;
(require 'popwin)
(popwin-mode 1)

;; 开启iedit
(require 'iedit)
;; C-x C-q 就可以直接在 Dired Mode 中进行编辑，使用之前学的 iedit-mode 和区域选择 就可以直接对多个文件进行重命名编辑了

;; 开启expand-region 扩展选中区域;
;; (require 'expand-region) require不需要

;;
;; (evil-mode 1)

;;
(require 'org-pomodoro)
(set-language-environment "UTF-8")

;; 当 org-mode 不能生效时，我们需要将与 Org 相关的配置放置于 with-eval-after-load 中;
(with-eval-after-load 'org
  ;; Org 模式相关设定
  )

;; init rtags;

;; code complete in rtags;
(require 'rtags)
(require 'company)

(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)
(global-company-mode t)
(define-key c-mode-base-map (kbd "<C-tab>") (function company-complete))

;; turn on rtags flycheck;
;; (require 'flycheck-rtags)

;; 
;; (defun my-flycheck-rtags-setup ()
;;   (flycheck-select-checker 'rtags)
;;   (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
;;   (setq-local flycheck-check-syntax-automatically nil))
;; (add-hook 'c-mode-hook #'my-flycheck-rtags-setup)
;; (add-hook 'c++-mode-hook #'my-flycheck-rtags-setup)
;; (add-hook 'objc-mode-hook #'my-flycheck-rtags-setup)

;; helm integration
;; (setq rtags-display-result-backend 'helm)

;; ivy integration
;; (setq rtags-display-result-backend 'ivy)

(eval-after-load 'cc-mode
  '(progn
     (require 'rtags)
     (mapc (lambda (x)
             (define-key c-mode-base-map
               (kbd (concat "C-c r " (car x))) (cdr x)))
           '(("." . rtags-find-symbol-at-point)
             ("," . rtags-find-references-at-point)
             ("v" . rtags-find-virtuals-at-point)
             ("V" . rtags-print-enum-value-at-point)
             ("/" . rtags-find-all-references-at-point)
             ("Y" . rtags-cycle-overlays-on-screen)
             (">" . rtags-find-symbol)
             ("<" . rtags-find-references)
             ("-" . rtags-location-stack-back)
             ("+" . rtags-location-stack-forward)
             ("D" . rtags-diagnostics)
             ("G" . rtags-guess-function-at-point)
             ("p" . rtags-set-current-project)
             ("P" . rtags-print-dependencies)
             ("e" . rtags-reparse-file)
             ("E" . rtags-preprocess-file)
             ("R" . rtags-rename-symbol)
             ("M" . rtags-symbol-info)
             ("S" . rtags-display-summary)
             ("O" . rtags-goto-offset)
             (";" . rtags-find-file)
             ("F" . rtags-fixit)
             ("X" . rtags-fix-fixit-at-point)
             ("B" . rtags-show-rtags-buffer)
             ("I" . rtags-imenu)
             ("T" . rtags-taglist)))))

;; enable lua-mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; 开启evilmode;
(evil-mode 1)

;;
(global-evil-leader-mode)

(evil-leader/set-key
  "e" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer)

(window-numbering-mode 1)

;;
;;(require 'powerline)
;;(powerline-default-theme)
(require 'powerline-evil)

;; Made some modes to use emacs-status
(dolist (mode '(ag-mode
		flycheck-error-list-mode
		git-rebase-hash))
  (add-to-list 'evil-emacs-state-modes mode))

;; 文件末尾
(provide 'init-packages)

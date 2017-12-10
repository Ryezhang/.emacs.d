;;
;;
(require 'org)
(setq org-src-fontify-natively t)

;; org-mode记录schedule;
(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)

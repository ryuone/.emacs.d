;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 同一ファイル名のバッファ名を分かりやすく
;; フォルダ名もバッファに含める
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (auto-install-from-emacswiki "recentf-ext")
(setq recentf-max-saved-items 500)
(setq recentf-exclude '("/TAGS$" "/var/tmp" "/tmp"))
(require 'recentf-ext)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 自動保存
;; install-elisp http://homepage3.nifty.com/oatu/emacs/archives/auto-save-buffers.el
(require 'auto-save-buffers)
(run-with-idle-timer 5 t 'auto-save-buffers)     ;; 5秒後に保存
(progn
  (setq auto-save-list-file-name nil)
  (setq auto-save-list-file-prefix nil)
  (setq make-backup-files nil))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tempbuf.el (バッファを自動で消す)
;:(auto-install-from-emacswiki "tempbuf.el")
(setq tempbuf-timer 120)
(require 'tempbuf)
(add-hook 'find-file-hook 'turn-on-tempbuf-mode)
(add-hook 'dired-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'compilation-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'completion-list-mode-hook 'turn-on-tempbuf-mode)
(add-hook 'view-mode-hook 'turn-on-tempbuf-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Auto byte compile
;; (install-elisp-from-emacswiki "auto-async-from-emacswiki.el")
(require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)


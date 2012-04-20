;;
;; auto-save-buffers.el
;;
;; ¸µ¤¦´³¡¼¥  ³²¬¹îÈş» ½  ¯¤À¤µ¤«£¿ (ELF:01128)
;;
;; » ¤Êı:
;;
;;   (require 'auto-save-buffers)
;;   (run-with-idle-timer 0.5 t 'auto-save-buffers) ; ¥¢¥¤¥ ë0.5É«£ÇÊİ¢±
;;
;; auto-save-buffers ¤Î on/off ¤òÀ êÂ ¨¤ ¤á¤¦´­¡¼ÄêµÁ (C-x a s)
;;
;;   (define-key ctl-x-map "as" 'auto-save-buffers-toggle)
;;

;; 2005-01-16 02:55:33 ¥ ¡¥¤¥ëÊİ¢±»ş¤¦´á¥«©»¡¼¥¸¤ò½§¶µ¤ ¤¤Üá¤ËÊ ¹ by okuyama

;; auto-save-buffers ¤ÇÂ§à  ¹¤ë¥ ¡¥¤¥ë ¤ÎÀµµ¬ ¸½
(defvar auto-save-buffers-regexp ""
  "*Regexp that matches `buffer-file-name' to be auto-saved.")

;; auto-save-buffers ¤ ü³°¤¹¤ë¥ ¡¥¤¥ë ¤ÎÀµµ¬ ¸½
(defvar auto-save-buffers-exclude-regexp "^$"
  "*Regexp that matches `buffer-file-name' not to be auto-saved.")

;;
;; ¤¢¤ ¤Ï auto-save-buffers ¤¦ûú¿ô¤ÇÀµµ¬ ¸½¤ò»ØÄ ¤ ¤ â¤ ­¤ë
;;
;; (require 'auto-save-buffers)
;; (run-with-idle-timer 0.5 t 'auto-save-buffers "\\.c$" "^$") ; .c ¤À¤±Â§àİ
;; (run-with-idle-timer 0.5 t 'auto-save-buffers ""   "\\.h$") ; .h ¤À¤±½ü³°
;;

;; nil ¤  ¡¼¥ ·¤ ¤ (¥¿¥¤¥ ¼¤ ó¤«£¿¤ Ş)
(defvar auto-save-buffers-active-p t
  "If non-nil, `auto-save-buffers' saves buffers.")

;; ¥ª¥ ¥ ë¤Î write-region ¤òÂàÈò
(fset 'original-write-region (symbol-function 'write-region))

;; ¥á¥«©»¡¼¥¸¤ò½§¶µ¤ ¤ write-region ¤òºîÀ®
(defun auto-save-buffers-write-region (start end filename &optional append
                                             visit lockname mustbenew)
  (original-write-region start end filename append
                         (cond ((stringp visit) visit)
                               ((not visit) nil)
                               (t 'BeQuiet)) lockname mustbenew))

;; ¾Ê¦ñ²Ä ¤¦ûú¿ô¤ ¢include/exclude Í ÎÀµµ¬ ¸½¤ò»ØÄê¤ ­¤ë
(defun auto-save-buffers (&rest regexps)
  "Save buffers if `buffer-file-name' matches `auto-save-buffers-regexp'."
  (let ((include-regexp (or (car  regexps) auto-save-buffers-regexp))
        (exclude-regexp (or (cadr regexps) auto-save-buffers-exclude-regexp))
        (buffers (buffer-list)))
    (unwind-protect
        (save-excursion
          (fset 'write-region (symbol-function 'auto-save-buffers-write-region))
          (while buffers
            (set-buffer (car buffers))
            (when (and buffer-file-name
                       auto-save-buffers-active-p
                       (buffer-modified-p)
                       (not buffer-read-only)
                       (string-match include-regexp buffer-file-name)
                       (not (string-match exclude-regexp buffer-file-name))
                       (not (buffer-base-buffer)) ;; ´ğÄì¥§·«© ¡¤¦³ßÊİ¢±
                       (file-writable-p buffer-file-name))
              (basic-save-buffer)
              (set-visited-file-modtime)
              (set-buffer-modified-p nil))
            (setq buffers (cdr buffers))))
      (fset 'write-region (symbol-function 'original-write-region)))))

;; auto-save-buffers ¤Î on/off ¤ò¥ °¥ë¤ÇÀ êÂ ¨¤ë
;; Based on the code by Yoshihiro (¤¤¤ä¤ÊÆüµ­ 2004-03-23)
(defun auto-save-buffers-toggle ()
  "Toggle `auto-save-buffers'"
  (interactive)
  (if auto-save-buffers-active-p
      (setq auto-save-buffers-active-p nil)
    (setq auto-save-buffers-active-p t))
  (if auto-save-buffers-active-p
      (message "auto-save-buffers on")
    (message "auto-save-buffers off")))

;;
;; Emacs 21 °  Ç Makefile ¤ÎÊ ¸»ş¤Ë "Suspicious line XXX. Save anyway"
;; ¤ ¤¤¦¥ í¥ó¥  ò½§¶µ¤ ¤¤Üá¤ ¹¤ ¤á¤¦³ª¤ ¸¤ ¤
;;
(add-hook 'makefile-mode-hook
          (function (lambda ()
                      (fset 'makefile-warn-suspicious-lines 'ignore))))

(provide 'auto-save-buffers)

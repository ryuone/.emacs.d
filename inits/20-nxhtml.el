;;; ===== nXML =====
;; (add-to-list 'auto-mode-alist '("\\.html$" . nxml-mode))
;; (add-to-list 'auto-mode-alist '("\\.xhtml$" . nxml-mode))
;; (add-hook 'nxml-mode-hook
;;                (lambda ()
;;                      (setq nxml-slash-auto-complete-flag t)    ;;"</"を入力すると自動で終了Tagを補完する。
;;                      (setq nxml-child-indent 4)                ;;子供エレメントに対するTabインデント：4
;;                      (setq indent-tabs-mode nil)               ;;インデントに空白を利用する。
;;                      (setq tab-width 2)                        ;;Tabインデント：4
;;                      (define-key nxml-mode-map "\r" 'newline-and-indent)
;;                      )
;; )

;; (load "nxhtml/autostart.el")


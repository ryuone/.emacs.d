;; -*- coding: utf-8; -*-
;;INSTALL
;; http://homepage3.nifty.com/satomii/software/elisp.ja.html
;; Changed source code.
;;
;;     jaspace / 修正内容
;;        ;; synch with `kill-all-local-variables'. `make-local-hook' is
;;        ;; necessary on Emacs 20.
;;-       (make-local-hook 'change-major-mode-hook)
;;+       (if (fboundp 'make-local-hook)
;;+               (make-local-hook 'change-major-mode-hook))
;;        (add-hook 'change-major-mode-hook 'jaspace-mode-quit nil t)
;;        ;; update the view.
;;
(if window-system
    (progn
      (require 'jaspace)
      (setq jaspace-alternate-jaspace-string "□")
      (setq jaspace-alternate-eol-string "↓\n")
      (setq jaspace-highlight-tabs t)
      (progn
        (add-hook 'text-mode-hook 'jaspace-mode)
        (add-hook 'ruby-mode-hook 'jaspace-mode)
        (add-hook 'haml-mode-hook 'jaspace-mode)
        (add-hook 'sass-mode-hook 'jaspace-mode)
        (add-hook 'feature-mode-hook 'jaspace-mode))
      )
  )

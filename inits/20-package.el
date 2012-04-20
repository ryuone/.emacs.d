; -*- coding: utf-8; -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (install-elisp-from-emacswiki "auto-install.el")
(require 'auto-install)
(auto-install-update-emacswiki-package-name t)                ;; 起動時にEmacsWikiのページ名を保管候補に加える
(auto-install-compatibility-setup)                            ;; install-elisp.el互換モードにする
(setq ediff-window-setup-function 'ediff-setup-windows-plain) ;; ediff関連のバッファを一つのフレームにまとめる


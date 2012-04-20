;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shell in Emacs
;; エスケープシーケンスによる色が付くように。
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; パスワードのプロンプトを認識してミニバッファで伏せ字にする。
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

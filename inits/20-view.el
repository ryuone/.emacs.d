;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Viewer.el
;; (auto-install-from-emacswiki "viewer.el")
(require 'viewer)
(setq view-read-only t)
(viewer-stay-in-setup)      ;;書き込み不可能ファイルでview-modeから抜けなくなる。
(setq viewer-modeline-color-unwritable "tomato"
      viewer-modeline-color-view "orange")
(viewer-change-modeline-color-setup)
(setq view-mode-by-default-regexp "\\.log$") ;; logファイルは常にview-modeで開く。

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key-chord.el(同時押し)
;; (auto-install-from-emacswiki "key-chord.el")
(require 'key-chord)
(setq key-chord-two-keys-delay 0.04)
(key-chord-mode 1)
(key-chord-define-global "jk" 'view-mode)
(key-chord-define emacs-lisp-mode-map "df" 'describe-function)


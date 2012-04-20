;; キーカスタマイズ
(global-set-key "\C-h" 'delete-backward-char)
;; 色の設定
(set-background-color "darkgreen")
(set-foreground-color "gray90")
;; 装飾を除去
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; フレームのタイトルにテスト版で有ることを明示
(setq frame-title-format "emacs-test")
;; エラー発生時デバッガが立ち上がるように設定
(setq debug-on-error t)

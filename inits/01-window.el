;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; マウスを有効化
;; (xterm-mouse-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Wheel mouse
;; (if window-system
;;      '((mouse-wheel-mode t)
;;       (setq mouse-wheel-follow-mouse t)))
;; (defun down-slightly () (interactive) (scroll-down 1))
;; (defun up-slightly   () (interactive) (scroll-up   1))
;; (global-set-key [mouse-4] 'down-slightly)
;; (global-set-key [mouse-5] 'up-slightly  )

(if window-system
    (cond
     ((eq system-type 'darwin)
      (set-face-attribute 'default nil
                          :family "Monaco"
                          :height 120)
      (set-fontset-font "fontset-default"
                        'japanese-jisx0208
                        '("Osaka" . "iso10646-1"))
      (set-fontset-font "fontset-default"
                        'katakana-jisx0201
                        '("Osaka" . "iso10646-1"))
      (setq face-font-rescale-alist
            '((".*Monaco-bold.*" . 1.0)
              (".*Monaco-medium.*" . 1.0)
              (".*Osaka-bold.*" . 1.2)
              (".*Osaka-medium.*" . 1.2)
              ("-cdac$" . 1.4)))
      )
     ((eq system-type 'gnu/linux)
      ;; (add-to-list 'default-frame-alist
      ;; 			   '(font . "-unknown-Takaoゴシック-normal-normal-normal-*-14-*-*-*-d-0-iso10646-1"))
      (set-frame-parameter nil 'alpha 90) ; 透明度
      (menu-bar-mode -1)
      (tool-bar-mode -1) ; ツールバー非表示
      (scroll-bar-mode -1) ; スクロールバー非表示
      (setq line-spacing 0.2) ; 行間
      (when (>= emacs-major-version 23)

        (set-frame-font "Inconsolata-12")
        (set-face-font 'variable-pitch "Inconsolata-12")
        ;; (set-default-font "Inconsolata-11")
        ;; (set-fontset-font (frame-parameter nil 'font)
        ;; 				  'japanese-jisx0208
        ;; 				  '("Takaoゴシック" . "unicode-bmp")
        ;; 				  )

        ;; (set-frame-font "Menlo-12")
        (set-fontset-font (frame-parameter nil 'font)
                          'japanese-jisx0208
                          (font-spec :family "M+2VM+IPAG circle" :size 14))
        (set-fontset-font (frame-parameter nil 'font)
                          'japanese-jisx0212
                          (font-spec :family "M+2VM+IPAG circle" :size 14))
        (set-fontset-font (frame-parameter nil 'font)
                          'katakana-jisx0201
                          (font-spec :family "M+2VM+IPAG circle" :size 14))
        )
      (setq ns-pop-up-frames nil)
      )
     )
  )

;; windows size
(if window-system
    (progn
      (setq initial-frame-alist
            (append
             '(
               (top                 . 0)     ; フレームの Y 位置(ピクセル数)
               (left                . 0)     ; フレームの X 位置(ピクセル数)
               (width               . 150)   ; フレーム幅(文字数)
               (height              . 50))   ; フレーム高(文字数)
             initial-frame-alist))
      ;; (setq initial-frame-alist
      ;;            '((width . 90) (height . 45)))
      ;; (set-background-color "Black")
      ;; (set-foreground-color "White")
      ;; (set-cursor-color "Gray")
      (set-frame-parameter nil 'alpha 90 )
      ))


(set-foreground-color "#FFFFFF") ; 文字色
(set-background-color "#000000") ; 背景色
(set-cursor-color "#FF0000") ; カーソル色
(set-face-background 'region "#222244") ; リージョン
(set-face-foreground 'modeline "#CCCCCC") ; モードライン文字
(set-face-background 'modeline "#333333") ; モードライン背景
(set-face-foreground 'mode-line-inactive "#333333") ; モードライン文字(非アクティブ)
(set-face-background 'mode-line-inactive "#CCCCCC") ; モードライン背景(非アクティブ)
(set-face-foreground 'font-lock-comment-delimiter-face "#AAAAAA") ; コメントデリミタ
(set-face-foreground 'font-lock-comment-face "#AAAAAA") ; コメント
(set-face-foreground 'font-lock-string-face "#7FFF7F") ; 文字列
(set-face-foreground 'font-lock-function-name-face "#BF7FFF") ; 関数名
(set-face-foreground 'font-lock-keyword-face "#FF7F7F") ; キーワード
(set-face-foreground 'font-lock-constant-face "#FFBF7F") ; 定数(this, selfなども)
(set-face-foreground 'font-lock-variable-name-face "#7F7FFF") ; 変数
(set-face-foreground 'font-lock-type-face "#FFFF7F") ; クラス
(set-face-foreground 'fringe "#666666") ; fringe(折り返し記号などが出る部分)
(set-face-background 'fringe "#282828") ; fringe

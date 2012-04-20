;; -*- coding: utf-8; -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Private Data
(setq user-full-name "Ryuichi Maeno")
(setq user-mail-address "ryuone@gmail.com")

;; 対の括弧目立たせる
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")

;; カーソル点滅
(blink-cursor-mode t)

;; 圧縮されたファイルの参照
(auto-compression-mode t)

;; 復帰文字(Ctrl-M)を削除する
(add-hook
 'comint-output-filter-functions
 'shell-strip-ctrl-m nil t)

;; iswitchbを使用する。
(iswitchb-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; M-x help-for-help v completion-ignored-extensionsで設定を確認可能
(add-to-list 'completion-ignored-extensions ".svn/")
(add-to-list 'completion-ignored-extensions ".git/")
(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))
(global-font-lock-mode t)
(setq default-tab-width 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq default-major-mode 'text-mode)        ;; デフォルトは text-mode
(setq delete-auto-save-files t)             ;; オートセーブファイルはいらない
(setq visible-bell t)
(setq ring-bell-function 'ignore)
(setq case-fold-search t)
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)
(setq scroll-step 1)                        ;; １行ずつスクロール
(setq line-move-visual nil)                 ;; 物理行でカーソルを移動する

(cond (window-system
       (setq x-select-enable-clipboard t)
       ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Shift + Cursorで範囲選択
;; (setq pc-select-selection-keys-only t)
;; (pc-selection-mode 1)

;; yes/no => y/n
(fset 'yes-or-no-p 'y-or-n-p)        ; y or n

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; sequential-command.el / sequential-command-config.el
;; (auto-install-batch "sequential-command")
(require 'sequential-command-config)
(sequential-command-setup-keys)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun reload-dotemacs()        ; .emacs をリロード
  "Reload the .emacs file"
  (interactive)
  (load-file "~/.emacs"))
(global-set-key "\C-x," 'reload-dotemacs)

(custom-set-variables
 '(display-time-mode t)
 '(menu-bar-mode t)
 '(safe-local-variable-values
   '((default-justification . full)
     (code . utf-8)
     (code . euc-jp-unix)))
 )
(custom-set-faces)

(progn
  (setq display-time-24hr-format t)
  (setq display-time-format "%Y-%m-%d(%a) %H:%M")
  (setq display-time-day-and-date t)
  (setq display-time-interval 30)
  (display-time)
)

;; 行番号を表示
(require 'linum)
(global-linum-mode 1)
;;(global-set-key [f5] 'linum-mode)
;;(global-set-key (kbd "<f5>") 'linum-mode)
(define-key global-map (kbd "<f6>") 'linum-mode)
(setq linum-format "%4d ")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; redo+.el
;; (install-elisp-from-emacswiki "redo+.el")
(require 'redo+)
(global-set-key (kbd "C-M-/") 'redo)
(setq undo-no-redo t)
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; point-undo.el(カーソル位置を戻す)
;; (install-elisp-from-emacswiki "point-undo.el")
(require 'point-undo)
(define-key global-map (kbd "<f7>") 'point-undo)
(define-key global-map (kbd "S-<f7>") 'point-redo)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; goto-chg.el
;; (install-elisp-from-emacswiki "goto-chg")
(require 'goto-chg)
(define-key global-map (kbd "<f8>") 'goto-last-change)
(define-key global-map (kbd "S-<f8>") 'goto-last-change-reverse)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; display
;; 現在の行のハイライト
(defface my-hl-line-face
  ;; 背景がdarkならば背景色を紺に
  '((((class color) (background dark))
     (:background "NavyBlue" t))
    ;; 背景がlightならば背景色を緑に
    (((class color) (background light))
     (:background "LightGoldenrodYellow" t))
    (t (:bold t)))
  "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)
;; (set-face-background 'hl-line "dark slate gray")
;; (setq hl-line-face '(:background "dark slate gray" t))
;; (setq hl-line-face '(:background "dimgray" t))
;; (setq hl-line-face '(:background "darkolivegreen" t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 行とカラムの表示
(line-number-mode t)
(column-number-mode t)

;; 行末の空白を削除
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; 自動で無駄なスペースを消す
(defun toggle-delete-trailing-whitespace-setting ()
  (interactive)
  (cond ((find 'delete-trailing-whitespace before-save-hook)
         (remove-hook 'before-save-hook 'delete-trailing-whitespace))
        (
         (add-hook 'before-save-hook 'delete-trailing-whitespace))))

;; shebang があるなら実行権限を勝手に付ける
(add-hook 'after-save-hook 'my-chmod-script)
(defun my-chmod-script()
  (interactive)
  (save-restriction
    (widen)
    (let ((name (buffer-file-name)))
      (if (and (not (string-match ":" name))
               (not (string-match "/\\.[^/]+$" name))
               (equal "#!" (buffer-substring 1 (min 3 (point-max)))))
          (progn (set-file-modes name (logior (file-modes name) 73))
                 (message "Wrote %s (chmod +x)" name))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacsclientコマンドにてファイルを開く事が可能となる。
;; C-x #で閉じる。
(server-start)

;; クライアントを終了するとき終了するかどうかを聞かない
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
;; 終了時にプロセスが残っていてもとにかく殺す
(defadvice save-buffers-kill-terminal (before my-save-buffers-kill-terminal activate)
  (when (process-list)
    (dolist (p (process-list))
      (set-process-query-on-exit-flag p nil))))

;; C-hでBackspace
(global-set-key "\C-h" 'delete-backward-char)

;;ジェネリックモードをオン
(require 'generic-x)

(global-set-key (kbd "C-m") 'newline-and-indent)

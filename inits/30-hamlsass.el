;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Sass関連
(require 'haml-mode)  ;;haml-mode
(add-hook 'haml-mode-hook
                  '(lambda ()
                         (progn
                           (setq tab-width 4)
                           (setq c-basic-offset 4)
                           (setq c-hanging-comment-ender-p t)
                           (setq indent-tabs-mode nil))))
(require 'sass-mode)  ;;sass-mode
(require 'scss-mode)  ;;scss-mode
(add-hook 'scss-mode-hook
                  '(lambda ()
                         (progn
                           (setq tab-width 4)
                           (setq c-basic-offset 4)
                           (setq c-hanging-comment-ender-p t)
                           (setq indent-tabs-mode nil))))
(setq scss-compile-at-save nil)


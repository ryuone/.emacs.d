;; c++-mode

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-hook 'c++-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c c") 'compile)
             (c-set-style "cc-mode")))

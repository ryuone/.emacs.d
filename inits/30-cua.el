(cua-mode t)
(setq cua-enable-cua-keys nil)

;; Ctrl-EnterでもOK
(global-set-key (kbd "C-c C-r") 'cua-set-rectangle-mark)

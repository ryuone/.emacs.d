;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; ----ruby-mode----
(require 'inf-ruby)
(setq interpreter-mode-alist
          (append '(("ruby" . ruby-mode)) interpreter-mode-alist))
(add-hook 'ruby-mode-hook
                  '(lambda ()
                         (inf-ruby-keys)
                         (setq tab-width 3)
                         (setq indent-tabs-mode nil)
                         (setq ruby-indent-level tab-width)
                         (setq ruby-deep-indent-paren-style nil)))
(require 'ruby-electric)
(add-hook 'ruby-mode-hook
                  '(lambda ()
                         (ruby-electric-mode t)))


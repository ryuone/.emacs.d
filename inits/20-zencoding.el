;; (install-elisp "https://raw.github.com/rooney/zencoding/master/zencoding-mode.el")
(require 'zencoding-mode)
(dolist (hook (list
               'sgml-mode-hook
               'html-mode-hook
               'text-mode-hook
               ))
  (add-hook hook 'zencoding-mode))

(define-key zencoding-mode-keymap "\C-z" 'zencoding-expand-line)

;;; git clone https://github.com/eschulte/rhtml.git
(add-to-list 'load-path "~/.emacs.d/elisp/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          (lambda () (rinari-launch)))

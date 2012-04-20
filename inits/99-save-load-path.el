;;; (install-elisp-from-emacswiki save-load-path.el)
;;; Emacs LISPテクニックバイブルより
(require 'save-load-path)
(setq save-load-path-file "~/.emacs.d/emacs-test-env/saved-load-path.el")
(save-load-path-initialize)

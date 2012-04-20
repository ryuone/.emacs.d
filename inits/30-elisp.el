(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (local-set-key (kbd "C-c e") 'eval-region)
             (setq indent-tabs-mode nil)))

;; lispxmp.el
;; INSTALL
;; (install-elisp-from-emacswiki "lispxmp.el")
(require 'lispxmp)
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)
(define-key lisp-interaction-mode-map (kbd "C-c C-d") 'lispxmp)

;; (define-key emacs-lisp-mode-map (kbd "C-x F") 'find-function)
;; (define-key lisp-interaction-mode-map (kbd "C-x F") 'find-function)

(find-function-setup-keys)

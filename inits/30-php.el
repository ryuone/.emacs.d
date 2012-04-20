;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;php-mode
;; (install-elisp "https://raw.github.com/ejmr/php-mode/master/php-mode.el")
;; (install-elisp "https://raw.github.com/tetsujin/emacs-php-align/master/php-align.el")
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-hook 'php-mode-hook
		  '(lambda ()
			 (require 'php-align)
			 (php-align-setup)
			 (progn
			   (setq tab-width 4)
			   (setq c-basic-offset 4)
			   (setq c-hanging-comment-ender-p t)
			   (setq indent-tabs-mode nil))))

;;INSTALL
;; (install-elisp-from-emacswiki "php-completion.el")
;; http://tech.kayac.com/archive/php-completion.html
(add-hook 'php-mode-hook
		  (lambda ()
			(require 'php-completion)
			(php-completion-mode t)
			(define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
			(when (require 'auto-complete nil t)
			  (make-variable-buffer-local 'ac-sources)
			  (add-to-list 'ac-sources 'ac-source-php-completion)
			  (auto-complete-mode t))))


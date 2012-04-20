;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; c-mode
;; (add-hook 'c-mode-hook
;; 		  '(lambda ()
;;              (setq c-basic-offset 4)
;; 			 (setq tab-width 4)
;; 			 (setq c-basic-offset tab-width)
;; 			 (setq indent-tabs-mode nil)
;; 			 (c-set-style "linux")
;; 			 (local-set-key (kbd "C-c c") 'compile)
;; 			 (local-set-key (kbd "C-c g") 'gdb)))

(defun my-c-mode-hook ()
  (c-set-style "linux")
  (setq tab-width 4)
  (setq c-basic-offset tab-width)
  (setq indent-tabs-mode nil)
  (local-set-key (kbd "C-c c") 'compile)
  (local-set-key (kbd "C-c g") 'gdb))
(add-hook 'c-mode-hook 'my-c-mode-hook)

(coding-system-put 'utf-8 'category 'utf-8)
(set-language-info
 "Japanese"
 'coding-priority (cons 'utf-8
						(get-language-info "Japanese" 'coding-priority)))
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8-unix)
(setq default-buffer-file-coding-system 'utf-8) ; obsolete Emacs 23.2
(set-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)


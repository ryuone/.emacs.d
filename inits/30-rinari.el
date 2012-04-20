;;; git clone https://github.com/eschulte/rinari.git
;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/elisp/rinari")
(require 'rinari)

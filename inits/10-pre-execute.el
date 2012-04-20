;; 起動前に、当Lispを実行

(require 'cl)
(setq byte-compile-warnings '(free-vars unresolved callargs redefine obsolete noruntime cl-functions interactive-only make-local))

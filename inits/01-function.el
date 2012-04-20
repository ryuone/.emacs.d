;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 使い捨てコード用のファイルを開く
;; http://d.hatena.ne.jp/rubikitch/20080923/1222104034
(defun open-junk-file ()
  (interactive)
  (let* ((file (expand-file-name
                (format-time-string
                 "%Y/%m/%Y-%m-%d-%H%M%S." (current-time))
                "~/Dropbox/Memo/junk/"))
         (dir (file-name-directory file)))
    (make-directory dir t)
    (find-file-other-window (read-string "Junk Code: " file))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; gitでgrep
;; http://d.hatena.ne.jp/authorNari/20091225/1261667956
(defun find-file-upward (name &optional dir)
  (setq dir (file-name-as-directory (or dir default-directory)))
  (cond
   ((string= dir (directory-file-name dir))
    nil)
   ((file-exists-p (expand-file-name name dir))
    (expand-file-name name dir))
   (t
    (find-file-upward name (expand-file-name ".." dir)))))

;; gitで管理しているディレクトリのルートから git grep する
(defun git-root-grep ()
  (interactive)
  (let (
        (git-dir (concat (find-file-upward ".git") "/../"))
        (cmd "git --no-pager grep -n ")
        (origin-default-directory default-directory)
        )
    (setq default-directory git-dir)
    (setq cmd
          (read-string "run git root grep (like this) : " cmd))
    (compilation-start cmd 'grep-mode
                       `(lambda (name)
                          (format "*git-root-grep@%s*" ,git-dir)))
    (setq default-directory origin-default-directory)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; バッファ切替時にバッファの中身を表示する。
;; http://www.bookshelf.jp/soft/meadow_28.html#SEC371
(defadvice iswitchb-exhibit
  (after
   iswitchb-exhibit-with-display-buffer
   activate)
  "選択している buffer を window に表示してみる。"
  (when (and
         (eq iswitchb-method iswitchb-default-method)
         iswitchb-matches)
    (select-window
     (get-buffer-window (cadr (buffer-list))))
    (let ((iswitchb-method 'samewindow))
      (iswitchb-visit-buffer
       (get-buffer (car iswitchb-matches))))
    (select-window (minibuffer-window))))


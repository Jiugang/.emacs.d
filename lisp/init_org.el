(setq org-hide-emphasis-markers t) ;;隐藏加粗的*、下划线的_等
(setq org-startup-indented t)    
(setq org-hide-leading-stars t)  ;;隐藏前导*号
(setq org-src-fontify-natively t)  ;;BEGIN_SRC代码块 支持语法高亮
(setq org-src-tab-acts-natively t) ;;BEGIN_SRC代码块 支持自动缩进


;;****************************** 快捷键 *********************************
(global-set-key (kbd "C-M-j") 'org-insert-subheading)
(global-set-key (kbd "<f9>") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(define-key global-map "\C-cl" 'org-store-link)

(setq org-directory "d:/ZJG")
(setq-default org-agenda-files (quote ("d:/ZJG/zjg.org")))
(setq org-log-done 'time)
(setq org-use-fast-todo-selection t)


(setq org-default-priority ?C)
(setq org-priority-faces '((?A . (:foreground "red" :weight bold))
                           (?B . (:foreground "orange"))
                           (?C . (:foreground "dim gray"))))

(defface pls-ignore-face
  '((t (:foreground "dim gray")))
  "Used in org-mode for ignore")

(defface org-todo-face
  '((t (:foreground "orange")
       ;;(:foreground "deep sky blue" :background "#272822")))
       ))
  "Used in org-mode for highlight")

(defface org-todo-risk-face
  '((t (:background "maroon" :foreground "white" :weight bold)))
  "Used in org-mode for risk/warning")

(defface org-todo-block-face
  '((t (:background "red" :weight bold)))
  "Used in org-mode for block")

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "orange")
              ("DONE" :foreground "dim gray" :weight)
              )))

(setq org-emphasis-alist
  '(("*" (bold :background "deep sky blue" :foreground "white"))
    ("/" italic)
    ("_" underline)
    ("=" (:background "maroon" :foreground "white"))
    ("~" (:background "deep sky blue" :foreground "MidnightBlue"))
    ("+" (:strike-through t))))

(font-lock-add-keywords 'org-mode
            '(
              ("DONE \\(.*\\)" 1 'pls-ignore-face)
              ("TODO \\(.*\\)" 1 'org-todo-face)
              ("风险 \\(.*\\)" 0 'org-todo-risk-face)
              ("阻塞 \\(.*\\)" 0 'org-todo-block-face)
              )
            )

(defun org-mode-my-init ()
  (define-key org-mode-map (kbd "×") (kbd "*"))
  (define-key org-mode-map (kbd "《") (kbd "<"))
  (define-key org-mode-map (kbd "》") (kbd ">"))
  )
(add-hook 'org-mode-hook 'org-mode-my-init)
(provide 'init_org)

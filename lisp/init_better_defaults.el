;;保存每个文件的光标位置
(save-place-mode 1)
;启动时自动加载上次的会话 
(desktop-save-mode 1)
;;自动加载外部修改
(global-auto-revert-mode t)

;将自动保存文件 和 自动备份文件，搞到临时目录。否则这些临时文件会直接在编辑文件所在目录生成，对git操作等太碍事了。
;autobackup是foo.c～这种，自动备份文件
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
;autosave是类似#foo.c#这种，每修改300字符就会做一次自动保存的文件
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
;file lock 是这种.#foo.c，emacs用于修改文件时防止被其他emacs实例同时修改。save时候消失。比较烦，建议直接关闭。
(setq create-lockfiles nil)
;选择一段后，再做输入，会删除选择，而不是在选择段后面继续输入。
(delete-selection-mode t)
;;行首作ctrlK时，直接删除该行
(setq-default kill-whole-line t)
;缩进时使用空格替代tab
(setq-default indent-tabs-mode nil)
;设置tab键宽度
(setq tab-width 4)
;打开最近文件
(recentf-mode 1)
;;高亮配对括号
(show-paren-mode 1)
;;高亮当前行, 跟easykill的高亮有冲突
;;(global-hl-line-mode 1)

(setq set-mark-command-repeat-pop t)



(provide 'init_better_defaults)



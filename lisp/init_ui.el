;;theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)

;;[windows]设置字体，否则会出现中文乱码为方块中有数字
(set-fontset-font "fontset-default" 'gb18030 (font-spec :family "Microsoft YaHei" :size 18))
(custom-set-faces '(default ((t (:family "Consolas" :foundry "outline" :height 130 :width normal)))))

;禁用起始界面
(setq inhibit-splash-screen t)
;禁用工具栏
(tool-bar-mode -1)
;禁用菜单栏
(menu-bar-mode -1)
;平滑滚动页面
(setq scroll-margin 3 scroll-conservatively 10000)
;设置光标形状
(setq-default cursor-type 'bar)











(provide 'init_ui)

;;;;;;;;;;;;; 基本设置 ;;;;;;;;;;;;;
;;set the default file path
(setenv "HOME" "D:/Installer/emacs")
(setenv "PATH" "D:/Installer/emacs")
(setq default-directory "~/")
;禁用起始界面
(setq inhibit-splash-screen t)
;[windows]设置字体，否则会出现中文乱码为方块中有数字
(set-fontset-font "fontset-default" 'gb18030 (font-spec :family "Microsoft YaHei" :size 18))
(custom-set-faces '(default ((t (:family "Consolas" :foundry "outline" :height 130 :width normal)))))
;;启动emacs服务器 然后要在已有的emacs中打开文件只需要： d:\Installer\emacs\bin\emacsclient.exe --server-file d:\Installer\emacs\.emacs.d\server\server -n "%1"
(server-start)
;;保存每个文件的光标位置
(save-place-mode 1)
;启动时自动加载上次的会话 
(desktop-save-mode 1)
;;自动加载外部修改
(global-auto-revert-mode t)
;打开最近文件
(recentf-mode 1)
;;高亮配对括号
(show-paren-mode 1)
;;高亮当前行, 跟easykill的高亮有冲突
;(global-hl-line-mode 1)
;禁用工具栏
(tool-bar-mode -1)
;禁用菜单栏
(menu-bar-mode -1)
;设置tab键宽度
(setq tab-width 4)
(defalias 'yes-or-no-p 'y-or-n-p)
;平滑滚动页面
(setq scroll-margin 3 scroll-conservatively 10000)
;缩进时使用空格替代tab
(setq-default indent-tabs-mode nil)

(setq set-mark-command-repeat-pop t)

;将自动保存文件 和 自动备份文件，搞到临时目录。否则这些临时文件会直接在编辑文件所在目录生成，对git操作等太碍事了。
;autobackup是foo.c～这种，自动备份文件
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
;autosave是类似#foo.c#这种，每修改300字符就会做一次自动保存的文件
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
;file lock 是这种.#foo.c，emacs用于修改文件时防止被其他emacs实例同时修改。save时候消失。比较烦，建议直接关闭。
(setq create-lockfiles nil)
;选择一段后，再做输入，会删除选择，而不是在选择段后面继续输入。
(delete-selection-mode t)
;设置光标形状
(setq-default cursor-type 'bar)
;;;;;;;;;;;;; 快速打开文件设置 ;;;;;;;;;;;;;
(defun open-init()
  (interactive)
  (find-file "~/.emacs.d/lisp/init.el"))
(defun open-org()
  (interactive)
  (find-file "D:/zjg/Personal/zjg.org"))
(defun open-tmp()
  (interactive)
  (find-file "c:/Users/FEC/Desktop/tmp.org"))


(global-set-key (kbd "<f1>") 'open-org)
(global-set-key (kbd "<f2>") 'open-tmp)


;;;;;;;;;;;;; PLUGINS ;;;;;;;;;;;;;
;Melpa 需要添加melpa-cn的源
(require 'package) 
(dolist (i '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
             ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
             ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
             ("melpa" . "https://melpa.org/packages/")))
             (add-to-list 'package-archives i))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) 

;;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(custom-set-variables
 '(flycheck-c/c++-cppcheck-executable "c:\\Program Files\\Cppcheck\\cppcheck.exe"))

(require 'unicad)
;;easy-kill
(require 'easy-kill)
(global-set-key [remap kill-ring-save] 'easy-kill)

;;swiper
(require 'swiper)
(global-set-key "\C-s" 'swiper)

;下载ivy.el counsel.el colir.el扔到~/.emacs.d/lisp目录，然后
(require 'ivy)
(require 'counsel)
(ivy-mode)  ;执行这个后，imenu、C-x b、C-x C-f都会使用imenu的交互界面
(global-set-key (kbd "M-x") 'counsel-M-x)
;目前发现的好功能：比自带的recentf-open-files的交互更友好
(defalias 'rf 'ivy-recentf)  

;company-mode plugin
(add-to-list 'load-path "~/.emacs.d/lisp/company-mode")
(require 'company)
(add-hook 'after-init-hook 'global-company-mode) ; To use company-mode in all buffers
(setq-default company-minimum-prefix-length 1)
(setq-default company-idle-delay 0.1)

;theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'monokai t)

;;删除多余空格
(require 'hungry-delete)
(global-hungry-delete-mode 1)

;拯救默认的可悲的M-f
(require 'misc)
(global-set-key (kbd "M-f") 'forward-to-word)

;自动匹配插入括号/引号等
(require 'smartparens-config)
(smartparens-global-mode t)
;;;;;;;;;;;;; ORG ;;;;;;;;;;;;;
;激活org中代码的语法高亮. org中可以<s然后tab键快速插入代码
(setq org-src-fontify-natively t)
;;orgmode中设置c++代码块自动缩进:将c++代码块拖选选中按下tab按键即可自动缩进。
(setq org-src-tab-acts-natively t)













(provide 'init)

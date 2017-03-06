;;;;;;;;;;;;; 基本设置 ;;;;;;;;;;;;;
;;set the default file path
(setenv "HOME" "D:/Installer/emacs")
(setenv "PATH" "D:/Installer/emacs")
(setq default-directory "~/")

;;启动emacs服务器 然后要在已有的emacs中打开文件只需要： d:\Installer\emacs\bin\emacsclient.exe --server-file d:\Installer\emacs\.emacs.d\server\server -n "%1"
(server-start)

(require 'init_ui)
(require 'init_better_defaults)
(require 'init_alias_keymap)
(require 'init_org)
(require 'init_packages)

;;;;;;;;;;;;; 快速打开文件设置 ;;;;;;;;;;;;;
(defun open-org()
  (interactive)
  (find-file "D:/zjg/Personal/zjg.org"))
(global-set-key (kbd "<f1>") 'open-org)

;;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(custom-set-variables
 '(flycheck-c/c++-cppcheck-executable "c:\\Program Files\\Cppcheck\\cppcheck.exe"))

;;删除多余空格
(require 'hungry-delete)
(global-hungry-delete-mode 1)


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

;company-mode plugin
(add-to-list 'load-path "~/.emacs.d/lisp/company-mode")
(require 'company)
(add-hook 'after-init-hook 'global-company-mode) ; To use company-mode in all buffers
(setq-default company-minimum-prefix-length 1)
(setq-default company-idle-delay 0.1)













(provide 'init)

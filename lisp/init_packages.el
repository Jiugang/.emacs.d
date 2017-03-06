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


;拯救默认的可悲的M-f
(require 'misc)
(global-set-key (kbd "M-f") 'forward-to-word)

;自动匹配插入括号/引号等
(require 'smartparens-config)
(smartparens-global-mode t)




(provide 'init_packages)

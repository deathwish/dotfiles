;; js2 mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(js2-basic-offset 2)
(js2-bounce-indent-p t)
(js2-cleanup-whitespace t)
(js2-global-externs nil)

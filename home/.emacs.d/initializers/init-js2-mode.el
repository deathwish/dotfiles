;; js2 mode
;; For some reason javascript-mode still loads, so use a load hook :/
; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js-mode-hook 'js2-mode)

;; See http://yoo2080.wordpress.com/2012/03/15/js2-mode-setup-recommendation/
(setq js2-missing-semi-one-line-override t)
(setq-default js2-basic-offset 2) ; 2 spaces for indentation (if you prefer 2 spaces instead of default 4 spaces for tab)
(setq js2-bounce-indent-p t)
(setq js2-cleanup-whitespace t)
(setq js2-global-externs nil)

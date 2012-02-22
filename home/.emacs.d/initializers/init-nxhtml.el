;; NXHTML mode setup
(require 'mumamo-fun)
(setq
      nxhtml-global-minor-mode t
      mumamo-chunk-coloring 'submode-colored
      nxhtml-skip-welcome t
      indent-region-mode t
      rng-nxml-auto-validate-flag nil
      nxml-degraded t)
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . mumamo-alias-eruby-html-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.rhtml\\'" . mumamo-alias-eruby-html-mumamo-mode))

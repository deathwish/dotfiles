(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(c-basic-offset 4)
 '(c-label-minimum-indentation 4)
 '(c-syntactic-indentation t)
 '(case-fold-search t)
 '(column-number-mode t)
 '(compilation-context-lines 1)
 '(compilation-scroll-output t)
 '(compilation-skip-threshold 2)
 '(compilation-window-height 10)
 '(current-language-environment "English")
 '(default-input-method "latin-1-prefix")
 '(display-battery-mode t)
 '(ecb-compile-window-height 5)
 '(ecb-compile-window-temporally-enlarge (quote both))
 '(ecb-compile-window-width (quote edit-window))
 '(ecb-enlarged-compilation-window-max-height 0.4)
 '(ecb-options-version "2.40")
 '(ecb-other-window-behavior (quote edit-and-compile))
 '(ecb-redraw-layout-quickly t)
 '(ecb-source-path (quote (("/home/lance/ken/visken-rails" "visken-rails") (#("/" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) #("/" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu"))) (#("/home/lance/src/futilepleasures-rails" 0 37 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) "futilepleasures-rails") ("/home/lance/src/bidding/trunk" "bidding-trunk") (#("/home/lance/src/futilepleasures/trunk" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu") 1 37 nil) "futilepleasures-trunk") (#("/home/lance/src/toca_sn/trunk/tsn" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu") 1 33 nil) "tsn_trunk") (#("/home/lance/src/bambera/bambera" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu") 1 31 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) "bambera") ("/home/lance/ken/visken-rails" "visken-rails") (#("/home/lance/src/tastefulprawn_repo" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu") 1 34 nil) "tastefulprawn") (#("/home/lance/src/ethnoken/trunk/visken-rails" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu") 1 43 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu")) "visken-rails-trunk") (#("/home/lance/src/tastefulprawn" 0 1 (help-echo "Mouse-2 toggles maximizing, mouse-3 displays a popup-menu") 1 29 nil) "tastefulprawn"))))
 '(ecb-vc-supported-backends (quote ((ecb-vc-dir-managed-by-CVS . ecb-vc-state) (ecb-vc-dir-managed-by-RCS . ecb-vc-state) (ecb-vc-dir-managed-by-SCCS . ecb-vc-state) (ecb-vc-dir-managed-by-SVN . ecb-vc-recompute-state) (ecb-vc-dir-managed-by-GIT . ecb-vc-state) (ecb-vc-dir-managed-by-MTN . ecb-vc-state))))
 '(ecb-windows-width 0.2)
 '(frame-background-mode (quote dark))
 '(fringe-mode 0 nil (fringe))
 '(global-font-lock-mode t nil (font-lock))
 '(home-end-enable t)
 '(ido-everywhere t)
 '(js2-basic-offset 3)
 '(js2-cleanup-whitespace t)
 '(mouse-wheel-mode t nil (mwheel))
 '(normal-erase-is-backspace t)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t nil (paren))
 '(size-indication-mode t)
 '(speedbar-track-mouse-flag t)
 '(standard-indent 4)
 '(tab-width 4)
 '(tool-bar-mode nil nil (tool-bar))
 '(transient-mark-mode t)
 '(woman-use-own-frame nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "#999999" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :family "ProggySquareTTSZ")))))
(if (load "folding" 'nomessage 'noerror)

    (folding-mode-add-find-file-hook))
(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist (cons '("\\.php5$" . php-mode) auto-mode-alist))
;;load the Tuareg OCaml mode
(setq load-path (cons "/home/lance/.emacs.d/tuareg-mode-1.45.3" load-path))
(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) 
auto-mode-alist))
  (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
    (autoload 'camldebug "camldebug" "Run the Caml debugger" t)
;;indent with spaces
(setq indent-tabs-mode nil)
(setq c-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))
(setq objc-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))
(setq c++-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))

(put 'upcase-region 'disabled nil)

(put 'downcase-region 'disabled nil)

;; Interactively Do Things
(require 'ido)
(ido-mode t)

;; ruby mode
(defun ruby-eval-buffer () (interactive)
"Evaluate the buffer with ruby."
(shell-command-on-region (point-min) (point-max) "ruby"))

(defun my-ruby-mode-hook ()
(font-lock-mode t)
(setq standard-indent 2)
(require 'ruby-electric)
(ruby-electric-mode t)
(define-key ruby-mode-map "\C-c\C-a" 'ruby-eval-buffer))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)
(setq rinari-tags-file-name "TAGS")

;; nxml (HTML ERB template support)
;; (load "~/.emacs.d/nxhtml/autostart.el")
;; (add-to-list 'load-path "~/.emacs.d/nxhtml/util")
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

;; CEDET
;; (add-to-list 'load-path "~/.emacs.d/cedet-1.0-pre6/common")
(defvar semantic-ectag-program "/usr/local/Cellar/ctags/5.8/bin/ctags")
(load-file "~/.emacs.d/cedet-1.0/common/cedet.el")
(global-ede-mode 1)                      ; Enable the Project management system
(semantic-load-enable-code-helpers)
(semantic-load-enable-gaudy-code-helpers)      ; Enable prototype help and smart completion 
(global-srecode-minor-mode 1)            ; Enable template insertion menu
(semantic-load-enable-primary-exuberent-ctags-support)

;; ECB
(add-to-list 'load-path "~/.emacs.d/ecb-2.40")
(require 'ecb)

;; js2 mode
(setq load-path (append (list (expand-file-name "~/.emacs.d/js2")) load-path))
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; cucumber.el
(add-to-list 'load-path "~/.emacs.d/cucumber.el")
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; rvm.el
(add-to-list 'load-path "~/.emacs.d/rvm.el")
(require 'rvm)
(rvm-use-default) ;; use rvm’s default ruby for the current Emacs session

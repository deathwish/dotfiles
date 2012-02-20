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
 '(ctypes-install t nil (ctypes))
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
 '(perldoc-define-F1 t nil (perldoc))
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

;;
;; ELPA and el-get auto-initializing wedge
;; See http://bytes.inso.cc/2011/08/13/auto-installing-packages-in-emacs-with-elpa-and-el-get/
;;

;; derived from ELPA installation
;; http://tromey.com/elpa/install.html
(defun eval-url (url)
  (let ((buffer (url-retrieve-synchronously url)))
  (save-excursion
    (set-buffer buffer)
    (goto-char (point-min))
    (re-search-forward "^$" nil 'move)
    (eval-region (point) (point-max))
    (kill-buffer (current-buffer)))))

;; Load ELPA
(add-to-list 'load-path "~/.emacs.d/elpa")

(defun install-elpa ()
  (eval-url "http://tromey.com/elpa/package-install.el"))

(if (require 'package nil t)
    (progn
      ;; Emacs 24+ includes ELPA, but requires some extra setup
      ;; to use the (better) tromey repo
      (if (>= emacs-major-version 24)
          (setq package-archives
                (cons '("tromey" . "http://tromey.com/elpa/")
                package-archives)))
      (package-initialize))
  (install-elpa))

;; Load el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(defun install-el-get ()
  (eval-url
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"))

(unless (require 'el-get nil t)
  (install-el-get))

;; extra recipes for packages unknown to el-get (yet)
(setq el-get-sources
	  '((:name css-mode :type elpa)
		(:name js2-mode-mooz
			   :type git
			   :url "git://github.com/mooz/js2-mode.git"
			   :load "js2-mode.el"
			   :compile ("js2-mode.el")
			   :features js2-mode)
		(:name feature-mode
			   :type git
			   :url "git://github.com/michaelklishin/cucumber.el"
			   :load "feature-mode.el"
			   :compile ("feature-mode.el")
			   :features feature-mode)))

;; list all packages you want installed
(setq my-el-get-packages
	  (append
	   '(css-mode js2-mode-mooz ecb nxhtml rinari scala-mode rvm tuareg-mode feature-mode)
	   (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-el-get-packages)

;; Aquamacs/OS X specific stuff
(if (boundp 'aquamacs-version)
	(progn
	  ;; No out of the box ctags here.
	  (defvar semantic-ectag-program "/usr/local/Cellar/ctags/5.8/bin/ctags")))

(if (load "folding" 'nomessage 'noerror)
	(folding-mode-add-find-file-hook))

(defalias 'perl-mode 'cperl-mode)

(setq auto-mode-alist (cons '("\\.php5$" . php-mode) auto-mode-alist))

;;load the Tuareg OCaml mode
(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
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
(require 'rinari)
(setq rinari-tags-file-name "TAGS")

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
(require 'semantic)
(setq semantic-load-turn-useful-things-on t)
;;(semantic-load-enable-code-helpers)
;;(semantic-load-enable-gaudy-code-helpers)      ; Enable prototype help and smart completion
;;(global-srecode-minor-mode 1)            ; Enable template insertion menu
;;(semantic-load-enable-primary-exuberent-ctags-support)
;;(load-file "~/.emacs.d/cedet-1.0/contrib/semantic-ectag-scala.el")
(require 'cedet)
(global-ede-mode 1)                      ; Enable the Project management system

;; ECB
(require 'ecb)

;; js2 mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; cucumber.el
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Scala Mode
(require 'scala-mode-auto)
(defun scala-turnoff-indent-tabs-mode ()
  (setq indent-tabs-mode nil))
(add-hook 'scala-mode-hook 'scala-turnoff-indent-tabs-mode)

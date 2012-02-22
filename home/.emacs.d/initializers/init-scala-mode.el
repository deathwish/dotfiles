;; Scala Mode
(require 'scala-mode-auto)
(defun scala-turnoff-indent-tabs-mode ()
  (setq indent-tabs-mode nil))
(add-hook 'scala-mode-hook 'scala-turnoff-indent-tabs-mode)

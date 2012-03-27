(defvar evil-enabled-state nil)

(defun toggle-evil-mode ()
  (interactive)
  (setq evil-enabled-state (not evil-enabled-state))
  (if evil-enabled-state
      (progn
        (message "Enabling Evil mode..")
        (evil-mode t))
    (message "Disabling Evil mode...")
    (dolist (buffer (buffer-list))
      (save-excursion
        (set-buffer buffer)
        (evil-local-mode -1)))
    (evil-mode -1)))
(global-set-key "\C-c\C-v" 'toggle-evil-mode)

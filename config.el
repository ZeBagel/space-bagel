
(message "BOORAH")

(setq auto-save-default nil)
(setq make-backup-files nil)

(spacemacs/add-to-hooks 'bagel-whitespace '(c++-mode-hook c-mode-hook csharp-mode-hook))
(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))

(defun bagel-whitespace ()
  (setq
   whitespace-style
   '(face
     spaces
     tabs
     tab-mark
     )
   )

  ;; Only show leading whitespace
  (setq whitespace-space-regexp "\\(^ +\\)")

  ;; TODO:: find better space-symbol
  (setq whitespace-display-mappings
        '((space-mark ?\  [?_])
          (tab-mark ?\t [?| ?\t])
          )
        )

  (custom-set-faces
   '(whitespace-space ((t (:bold t :background "gray22"))))
   '(whitespace-tab ((t (:bold t :foreground "gray25"))))
   '(whitespace-newline ((t (:bold t :foreground "gray25"))))
   )

  (whitespace-mode)
  )

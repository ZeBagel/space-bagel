
(setq helm-ag-base-command "ag -SU")
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq-default buffer-file-coding-system 'utf-8-unix)


(setq helm-always-two-windows nil
      helm-split-window-in-side-p nil
      helm-split-window-default-side 'other
      )

(add-hook 'focus-out-hook (lambda () (save-some-buffers t)))
(add-hook 'helm-mode-hook (lambda () (setq toggle-truncate-lines 1)))

(add-hook 'cmode-mode-hook
          (lambda ()
            (bagel-tabs)
            (bagel-whitespace)
            ))

(add-hook 'csharp-mode-hook
          (lambda ()
            (bagel-tabs)
            (bagel-whitespace)
            ))

(add-hook 'c++-mode-hook
          (lambda ()
            (bagel-tabs)
            (bagel-whitespace)
            (setq flycheck-clang-language-standard "c++11")
            ))


(defun bagel-tabs ()
  (setq-local indent-tabs-mode t)
  (setq-local tab-width 2)
  (setq-local tab-stop-list '(2 4 6))
  (setq-local c-basic-offset 2)
  )

(defun bagel-whitespace ()
  (toggle-truncate-lines 1)
  (setq
   whitespace-style
   '(face
     spaces
     tabs
     tab-mark
     trailing
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

  (whitespace-mode)

  (custom-set-faces
   '(whitespace-space ((t (:bold t :background "gray22"))))
   '(whitespace-tab ((t (:bold t :background nil :foreground "gray25"))))
   '(whitespace-newline ((t (:bold t :foreground "gray25"))))
   )

  )

(defun keyboard-escape-quit ()
  "Exit the current \"mode\" (in a generalized sense of the word).
This command can exit an interactive command such as `query-replace',
can clear out a prefix argument or a region,
can get out of the minibuffer or other recursive edit,
cancel the use of the current buffer (for special-purpose buffers),
or go back to just one window (by deleting all but the selected window)."
  (interactive)
  (cond ((eq last-command 'mode-exited) nil)
        ((region-active-p)
         (deactivate-mark))
        ((> (minibuffer-depth) 0)
         (abort-recursive-edit))
        (current-prefix-arg
         nil)
        ((> (recursion-depth) 0)
         (exit-recursive-edit))
        (buffer-quit-function
         (funcall buffer-quit-function))
        ((not (one-window-p t))
         (keyboard-quit))
        ((string-match "^ \\*" (buffer-name (current-buffer)))
         (bury-buffer))))

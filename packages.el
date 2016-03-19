
(defconst space-bagel-packages
  '(
    whitespace
    )
  )

(defun space-bagel/init-whitespace ()
  (use-package whitespace
    :defer t
    :init
    (progn
      (message "Woo Init")
      )
    :config
    (progn
      (message "Woo Config")
      )
  ))

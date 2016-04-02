
(setq space-bagel-packages
      '(
        projectile
        ))

(defun space-bagel/post-init-projectile ()
  (spacemacs/set-leader-keys "py" 'helm-etags-select)
  )

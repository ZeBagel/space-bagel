
(setq space-bagel-packages
      '(
        projectile
        ample-theme
        hc-zenburn-theme
        niflheim-theme
        stekene-theme
        twilight-theme
        sublime-themes
        ))

(defun space-bagel/post-init-projectile ()
  (spacemacs/set-leader-keys "py" 'helm-etags-select)
  )

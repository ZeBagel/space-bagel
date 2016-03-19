
(defvar bagel-vc-mode-hook nil)
(add-to-list 'auto-mode-alist '("*bagel-vc*" . bagel-vc-mode))

(defvar bagel-vc-mode-map
  (let ((bagel-vc-mode-map (make-keymap)))
    (define-key bagel-vc-mode-map "\C-j" 'newline-and-indent)
    bagel-vc-mode-map)
  "Keymap for bagel-vc major mode")

(provide 'bagel-vc-mode)

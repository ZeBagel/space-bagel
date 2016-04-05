
(spacemacs/set-leader-keys-for-major-mode 'csharp-mode "cr" 'bagel-csharp-compile-region)
(spacemacs/set-leader-keys-for-major-mode 'csharp-mode "cl" 'bagel-csharp-compile-line)
(spacemacs/set-leader-keys-for-major-mode 'csharp-mode "cb" 'bagel-csharp-compile-buffer)

(defvar bagel-csharp-compiler
  "compileSharp.bat %s %s"
  ;; "c:/Windows/Microsoft.NET/Framework64/v4.0.30319/csc.exe /t:exe /out:%s %s"
  )

(defvar bagel-csharp-single-in
  "C:\\tmp\\csharpIn.cs"
  )

(defvar bagel-csharp-single-out
  "C:\\tmp\\csharpOut.exe"
  )

(defun bagel-csharp-compile-buffer ()
  (interactive)
  (write-region (point-min) (point-max) bagel-csharp-single-in)
  (bagel-csharp-compile-and-run-in-file)
  )

(defun bagel-csharp-compile-region ()
  (interactive)
  (let* ((contents
          (or (buffer-substring (region-beginning) (region-end))
              (buffer-substring (line-beginning-position) (line-end-position))))
        (file (format bagel-csharp-build-class contents)))
    (write-region file nil bagel-csharp-single-in)
    (bagel-csharp-compile-and-run-in-file)
  ))

(defun bagel-csharp-compile-line ()
  (interactive)
  (let* ((contents (buffer-substring (line-beginning-position) (line-end-position)))
         (file (format bagel-csharp-build-class contents)))
    (write-region file nil bagel-csharp-single-in)
    (bagel-csharp-compile-and-run-in-file)
    ))

(defun bagel-csharp-compile-in-file ()
  (interactive)
  (let ((x (concat bagel-csharp-compiler bagel-csharp-single-out bagel-csharp-single-in)))
    (message x)
    (shell-command x)
    )
  )

(defun bagel-csharp-compile-and-run-in-file ()
  (interactive)
  (bagel-csharp-compile-in-file)
   )


(defvar bagel-csharp-build-class
"
#pragma warning disable
using System;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using System.Text;

public class ReplClass {
	public static void Main() {
		Console.WriteLine(Execute());
	}

	static string Execute() {
		try {
			var obj = Do(() => {
%s
				});

			return obj == null \? \"NULL\" : obj.ToString();
		}
		catch(Exception e) {
			return e.ToString();
		}
	}

	static T Do<T>(Func<T> f) { return f(); }

	static string Do(Action f) { f(); return \"Success\"; }
}
"
  )

(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/elisp"))

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(require 'package)
(package-initialize)

(setq package-enable-at-startup nil)
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

;; Don't excessively prompt on exit - this prevents emacspeak nags
;; Thanks to https://stackoverflow.com/questions/2706527/make-emacs-stop-asking-active-processes-exist-kill-them-and-exit-anyway
(require 'cl)
(require 'cl-lib)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

;; Don't litter save files
(defvar my-auto-save-folder "~/.emacs.d/.saves/"
  "Autosave folder.")
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))
(setq auto-save-file-name-transforms
      `((".*" ,my-auto-save-folder t)))

;; Place custom settings in their own file.
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file) (load custom-file))

;; Mute bytecode messages
(setq warning-minimum-level :emergency)

(require 'my-emacspeak)
(require 'my-functions)
(require 'my-evil)
(require 'my-ui)


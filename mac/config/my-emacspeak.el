(require 'cl)

;; Prevent startup errors
(defvar emacspeak-we-url-executor nil)
(defvar ido-process-ignore-lists nil)
(defvar select-object nil)
(defvar emacspeak-personality-voiceify-faces nil)

;; Don't prompt on exit about killing the speech server
(require 'cl-lib)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

(setq load-path (cons "~/.emacs.d/emacspeak/lisp" load-path))
(setq emacspeak-directory "~/.emacs.d/emacspeak")
(setq dtk-program "mac")
(require 'emacspeak-setup)
(require 'mac-voices)
(emacspeak-tts-startup-hook)
(dtk-set-rate 500 t)

(provide 'my-emacspeak)

(setq load-path (cons "~/.emacs.d/emacspeak/lisp" load-path))
(setq emacspeak-directory "~/.emacs.d/emacspeak")

(setq dtk-program "espeak")
(require 'emacspeak-setup)
(dtk-set-rate 310 t)

(provide 'my-emacspeak)


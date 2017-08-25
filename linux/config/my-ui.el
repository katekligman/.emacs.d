;; No startup screen
(setq inhibit-startup-screen t)

;; No buttons
(tool-bar-mode -1)

;; Word wrap at word boundaries
(visual-line-mode 1)

;; No toolbars or splash screens
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))

;; No menus
(menu-bar-mode -1)

;; Don't scroll jump near the bottom of the screen
(setq scroll-conservatively 9999
      scroll-preserve-screen-position t)

;; 'y' or 'n'
(defalias 'yes-or-no-p 'y-or-n-p)

;; UTF8
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq sentence-end-double-space nil)

;; don't flash the screen
(setq ring-bell-function 'ignore)

;; Mode-line

(setq mode-line-format
          (list
           ;; value of `mode-name'
           "%m: "
           ;; value of current buffer name
           "buffer %b, "
           ;; value of current line number
           "line %l "
           "-- user: "
           ;; value of user
           (getenv "USER")))

(provide 'my-ui)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq auto-save-file-name-transforms `((".*" "~/.saves/" t)))

(setq next-screen-context-lines 10) ;; 10 lines of context for C-v and M-v
(setq scroll-step           1       ;; don't jump when scrolling past top or bottom of page
      scroll-conservatively 10000)

(setq kill-ring-max 4)

(global-set-key (kbd "C-c h") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(global-set-key (kbd "M-n")
    (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "M-p")
    (lambda () (interactive) (next-line -5)))

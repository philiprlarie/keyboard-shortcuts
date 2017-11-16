(setq backup-directory-alist `((".*" . ,"~/.saves")))
(setq auto-save-file-name-transforms `((".*" ,"~/.saves/" t)))
(setq auto-save-timeout 5) ;; auto save very often, after 5 seconds ish of idle
(setq auto-save-interval 20) ;; save every 20 characters typed (this is the minimum)

(setq next-screen-context-lines 10) ;; 10 lines of context for C-v and M-v
(setq scroll-step           1       ;; don't jump when scrolling past top or bottom of page
    scroll-conservatively 10000)

(setq kill-ring-max 4)
(add-hook 'java-mode-hook
    (lambda () (modify-syntax-entry ?_ "w"))) ;; make '_' a word character


(global-set-key (kbd "C-c h") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)

(global-set-key (kbd "M-n")
    (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "M-p")
    (lambda () (interactive) (next-line -5)))

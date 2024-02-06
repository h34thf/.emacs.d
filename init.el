;; to make it diff

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)
(setq inhibit-startup-screen t)

; https://stackoverflow.com/questions/12737317/collapsing-the-current-outline-in-emacs-org-mode
; Documentation:
; Where should `org-cycle' emulate TAB.
; nil         Never
; white       Only in completely white lines
; whitestart  Only at the beginning of lines, before the first non-white char
; t           Everywhere except in headlines
; exc-hl-bol  Everywhere except at the start of a headline
; (setq org-cycle-emulate-tab 'white) ; original, doesn't work
; (setq org-cycle-emulate-tab t) ; doesn't work
; (setq org-cycle-emulate-tab nil) ; original, doesn't work
; (setq evil-want-C-i-jump nil) ; works

(require 'package)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/"))

(setq package-enable-at-startup nil)
(package-initialize)

(require 'evil)
(evil-mode t)
(require 'evil-leader)
(evil-leader/set-leader "<SPC>")
(global-evil-leader-mode)
(evil-leader/set-key
 "a a" 'org-agenda
 "a t" 'org-todo-list
 "a M" 'org-tags-view
 ;"a o" '(org-agenda arg "c")
 "b" 'switch-to-buffer
 "s d" 'org-deadline
 "s s" 'org-schedule
 "s c" 'org-check-deadlines
 "p" 'org-priority-up
 "h" 'org-do-promote
 "H" 'org-promote-subtree
 "i" 'org-toggle-inline-images 
 "l" 'org-do-demote
 "L" 'org-demote-subtree
 "d" 'org-time-stamp
 "t" 'org-todo)


; https://github.com/emacs-evil/evil/issues/1604
(with-eval-after-load 'evil-maps (define-key evil-motion-state-map (kbd "TAB") nil))


(require 'undo-tree)
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)

(setq org-startup-indented t)
(require 'org-agenda)
(define-key org-agenda-mode-map (kbd "j") 'org-agenda-next-item)
(define-key org-agenda-mode-map (kbd "k") 'org-agenda-previous-item)
(define-key org-agenda-mode-map (kbd "p") 'org-agenda-priority-up)
(setq org-agenda-files (list "~/heath.org"))

(add-hook 'org-mode-hook #'(lambda ()
                             ;; make the lines in the buffer wrap
                             ;; around the edges of the screen.
                             (visual-line-mode)
                             (org-indent-mode)))

(show-paren-mode 1)

(setq org-todo-keywords
      '((sequence "TODO" "IN_P" "WAIT" "|" "DONE" "CANC")
	(sequence "NEW_" "EM_1" "VM_1" "EM_2" "VM_2" "|" "MSD_" "BAD_")))


; Arbitrary frame size and position: Use functions
; set-frame-height
; set-frame-width
; set-frame-size
; set-frame-position
(when window-system (set-frame-size (selected-frame) 87 38)
                    (set-frame-position (selected-frame) 0 0))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; 3rd-party stuff I'm trying.  Comments ;;;;;;;
;;;;;;;;;; are from 3rd party. Source URL: ;;;;;;;;;;;;;
;; https://github.com/patrickt/emacs/tree/ae824f688767358683089bdfe8a268ca0b0267c8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq-default indent-tabs-mode nil)

; It’s good that Emacs supports the wide variety of file encodings it does,
; but UTF-8 should always, always be the default.
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)

; We also need to turn on a few modes to have behavior
; that’s even remotely modern.
(delete-selection-mode t)
(global-display-line-numbers-mode t)
(column-number-mode)

; Emacs 27 comes with fast current-line highlight functionality,
; but it can produce some visual feedback in vterm buffers,
; so we only activate it in programming or text modes.
(require 'hl-line)
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'text-mode-hook #'hl-line-mode)

; Emacs is super fond of littering filesystems with backups and autosaves,
; since it was built with the assumption that multiple users could be
; using the same Emacs instance on the same filesystem.
; This was valid in 1980. It is no longer the case.
(setq
 make-backup-files nil
 auto-save-default nil
 create-lockfiles nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;; auto-generated settings ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "ProFontWindows" :foundry "outline" :slant normal :weight normal :height 181 :width normal)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#000000" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#eaeaea"))
 '(beacon-color "#d54e53")
 '(column-number-mode t)
 '(custom-enabled-themes '(sanityinc-tomorrow-night))
 '(custom-safe-themes
   '("8b9d07b01f2a9566969c2049faf982cab6a4b483dd43de7fd6a016bb861f7762" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default))
 '(fci-rule-color "#424242")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(undo-tree color-theme-sanityinc-tomorrow evil-leader color-theme-sanityinc-tomorrow-day org-bullets evil))
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a")))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))

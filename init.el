(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

                                        ; 패키지 인스톨

(unless (package-installed-p 'color-theme-sanityinc-tomorrow)
  (package-install 'color-theme-sanityinc-tomorrow))
(unless (package-installed-p 'alchemist)
  (package-install 'alchemist))
(unless (package-installed-p 'company)
  (package-install 'company))
(unless (package-installed-p 'elixir-mode)
  (package-install 'elixir-mode))
(unless (package-installed-p 'flycheck-elixir)
  (package-install 'flycheck-elixir))
(unless (package-installed-p 'projectile)
  (package-install 'projectile))
(unless (package-installed-p 'helm)
  (package-install 'helm))
(unless (package-installed-p 'helm-projectile)
  (package-install 'helm-projectile))
(unless (package-installed-p 'omnisharp)
  (package-install 'omnisharp))
(unless (package-installed-p 'csharp-mode)
  (package-install 'csharp-mode))
(unless (package-installed-p 'undo-tree)
  (package-install 'undo-tree))
(unless (package-installed-p 'spaceline)
  (package-install 'spaceline))
(unless (package-installed-p 'window-numbering)
  (package-install 'window-numbering))
(unless (package-installed-p 'magit)
  (package-install 'magit))
(unless (package-installed-p 'fill-column-indicator)
  (package-install 'fill-column-indicator))
(unless (package-installed-p 'ag)
  (package-install 'ag))


; 가능하면 customize를 이용한다
                                        ; 폰트

(set-default-font "-*-Fira Code-light-normal-normal-*-14-*-*-*-m-0-iso10646-1")

(window-numbering-mode)
(helm-mode 1)
(setq-default cursor-in-non-selected-windows 'hollow)

                                        ; company 모드

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))

                                        ; alchemist 패키지

(add-hook 'elixir-mode-hook 'alchemist-mode)
(add-hook 'alchemist-mode-hook
          (lambda ()
            (define-key alchemist-mode-map [f12] 'alchemist-goto-definition-at-point)))

                                        ; elixir 모드

                                        ; c# 모드

(add-hook 'csharp-mode-hook
          (lambda ()
            (setq tab-width 4)
            (setq indent-tabs-mode t)
            (electric-pair-mode)
            (setq omnisharp-server-executable-path "~/Downloads/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
            (omnisharp-mode)
            (define-key csharp-mode-map [f12] 'omnisharp-go-to-definition-other-window)))
(add-hook 'omnisharp-mode-hook 'set-exit-flags)
(defun set-exit-flags ()
  (dolist (proc (process-list))
    (set-process-query-on-exit-flag proc nil)))

                                        ; spaceline
(require 'spaceline-config)
(spaceline-emacs-theme)

                                        ; smooth-scrolling
(setq auto-window-vscroll nil
      scroll-margin 5
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

                                        ; 키

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "s-b") 'helm-mini)
(global-set-key (kbd "s-p") 'helm-projectile)
(global-set-key (kbd "s-o") 'helm-find-files)
(global-set-key (kbd "s-/") 'my-comment)
(global-set-key [escape] 'keyboard-escape-quit)
(global-set-key (kbd "s-e") 'isearch-forward-symbol-at-point)
(global-set-key (kbd "s-f") 'isearch-forward)
(global-set-key (kbd "s-g") 'isearch-repeat-forward)
(global-set-key (kbd "s-F") 'projectile-ag)
(global-set-key (kbd "s-q") 'save-buffers-kill-terminal)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-k") 'my-kill-buffer)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-w") 'delete-window)
(global-set-key (kbd "s-W") 'delete-frame)
(global-set-key (kbd "s-n") 'make-frame)
(global-set-key (kbd "s-z") 'undo-tree-undo)
(global-set-key (kbd "s-s") 'save-some-buffers)
(global-set-key (kbd "s-Z") 'undo-tree-redo)
(global-set-key (kbd "s-\\") 'my-split-window)
(global-set-key (kbd "s-|") 'fci-mode)
(global-set-key (kbd "s-1") 'select-window-1)
(global-set-key (kbd "s-2") 'select-window-2)
(global-set-key (kbd "s-3") 'select-window-3)
(global-set-key (kbd "s-4") 'select-window-4)
(global-set-key (kbd "s-=") 'indent-region)
(global-set-key (kbd "s-,") 'customize)
(global-set-key (kbd "<f1>") 'helm-apropos)
(global-set-key (kbd "<f4>") 'flycheck-next-error)
(global-set-key (kbd "<f9>") 'alchemist-mix-test)
(global-set-key (kbd "<f11>") 'magit-status)
(global-set-key (kbd "s-l") 'eval-last-sexp)

(define-key isearch-mode-map (kbd "s-f") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "s-F") 'isearch-repeat-backward)

                                        ; 내 함수들
(add-hook 'focus-out-hook 'my-save)
(defun my-save ()
  (interactive)
  (save-some-buffers t))

(defun my-split-window ()
  (interactive)
  (delete-other-windows)
  (split-window-right))

(defun my-comment ()
  (interactive)
  (let ((start (line-beginning-position))
        (end (line-end-position)))
    (when (region-active-p)
      (setq start (save-excursion
                    (goto-char (region-beginning))
                    (beginning-of-line)
                    (point))
            end (save-excursion
                  (goto-char (region-end))
                  (end-of-line)
                  (point))))
    (comment-or-uncomment-region start end)))

(defun my-kill-buffer ()
  (interactive)
  (kill-buffer nil))

                                        ; customize

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#cccccc" "#f2777a" "#99cc99" "#ffcc66" "#6699cc" "#cc99cc" "#66cccc" "#515151"))
 '(backup-directory-alist (quote (("." . "~/Downloads/backup"))))
 '(column-number-mode t)
 '(company-idle-delay 0.1)
 '(company-minimum-prefix-length 2)
 '(company-tooltip-flip-when-above t)
 '(cua-mode nil nil (cua-base))
 '(cursor-type (quote (bar . 3)))
 '(custom-enabled-themes (quote (adwaita)))
 '(custom-safe-themes
   (quote
    ("c31fa0ae5bd95aade4854dcf2fb2130dd2c225d57b5c85a3226001c2e59fa5d0" "06901dfc137da2060fb9bcfc4819a5ca7c7cd96fb685fe1942a6d4110ff89d33" "c58cbdc3633f6537e5c7bc29529d26736527bd80cd1348768e189eadfbcb10b2" "c449c1bdbc03f5521791a78083b6958f40469d64ee10a0669e8eea7bbb31b888" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(desktop-save-mode t)
 '(dired-use-ls-dired nil)
 '(fci-rule-color "#515151")
 '(fill-column 100)
 '(global-company-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(global-undo-tree-mode t)
 '(global-whitespace-mode t)
 '(helm-M-x-fuzzy-match t)
 '(helm-apropos-fuzzy-match t)
 '(helm-buffers-fuzzy-matching t)
 '(helm-mode t)
 '(helm-recentf-fuzzy-match t)
 '(helm-split-window-in-side-p t)
 '(indent-tabs-mode nil)
 '(initial-frame-alist
   (quote
    ((left . 700)
     (top . 20)
     (width . 212)
     (height . 80))))
 '(linum-format "%4d")
 '(mac-auto-operator-composition-mode t)
 '(mac-command-modifier (quote super))
 '(mac-option-modifier (quote meta))
 '(mouse-wheel-scroll-amount (quote (2 ((shift) . 1) ((control)))))
 '(projectile-global-mode t)
 '(scroll-bar-mode nil)
 '(shell-file-name "/bin/bash")
 '(size-indication-mode t)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil)
 '(whitespace-style
   (quote
    (face empty space-after-tab space-before-tab trailing))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

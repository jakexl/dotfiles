										; 패키지 관리자

(require 'package)
(add-to-list 'package-archives
			 '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
										; 간단한 설정들

(setq make-backup-files nil)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode +1)
(global-hl-line-mode +1)
(mac-auto-operator-composition-mode +1)

(desktop-save-mode 1)
(when window-system (set-frame-size (selected-frame) 212 80))

										; 폰트

(add-to-list 'default-frame-alist '(font . "Fira Code-14"))
(set-face-attribute 'default t :font "Fira Code-14")

										; vi 에뮬레이션

(require 'evil)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-mode 1)

										; elixir 모드
										; alchemist

(unless (package-installed-p 'alchemist)
  (package-install 'alchemist))

(require 'elixir-mode)
(add-hook 'elixir-mode-hook
		  (lambda ()
			(set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
				 "\\(?:^\\|\\s-+\\)\\(?:do\\)")
			(set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
			(ruby-end-mode +1)))

										; smartparens 모드

(require 'smartparens-config)
(smartparens-global-mode t)
(show-smartparens-global-mode t)
(sp-with-modes '(elixir-mode)
  (sp-local-pair "fn" "end"
         :when '(("SPC" "RET"))
         :actions '(insert navigate))
  (sp-local-pair "do" "end"
         :when '(("SPC" "RET"))
         :post-handlers '(sp-ruby-def-post-handler)
         :actions '(insert navigate)))

(sp-with-modes '(csharp-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET"))))

										; ido 모드

(require 'ido)
(ido-mode t)

										; company 모드

(add-hook 'after-init-hook #'global-company-mode)
(eval-after-load 'company
  '(progn
	 (define-key company-active-map (kbd "<tab>") 'company-select-next)
	 (define-key company-active-map (kbd "<S-tab>") 'company-select-previous)
	 (add-to-list 'company-backends 'company-omnisharp)
	 (company-flx-mode +1)))

										; c# 모드

(add-hook 'csharp-mode-hook 'omnisharp-mode)
(add-hook 'csharp-mode-hook 'evil-smartparens-mode)
(add-hook 'csharp-mode-hook 'set-exit-flags t)
(defun set-exit-flags ()
  (set-exit-flag "Omni-Server")
  (set-exit-flag "Omni-Server<1>"))
(defun set-exit-flag (process)
  (let ((omni-server (get-process process)))
	(if omni-server
		(set-process-query-on-exit-flag omni-server nil)
	  nil)))
(add-hook 'omnisharp-mode-hook 'set-exit-flags)

										; 키보드

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key "\M-\\" 'evil-window-vsplit)
(global-set-key "\M-b" 'helm-buffers-list)
(global-set-key "\M-p" 'projectile-find-file)
(global-set-key "\M-s" 'save-buffer)
(global-set-key "\M-w" 'evil-window-delete)
(evil-define-key 'normal omnisharp-mode-map (kbd "<f2>") 'omnisharp-rename)
(evil-define-key 'normal omnisharp-mode-map (kbd "<f12>") 'omnisharp-go-to-definition)
(evil-define-key 'normal omnisharp-mode-map (kbd "<S-f12>") 'omnisharp-find-usages)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key "b" 'ido-switch-buffer)
(evil-leader/set-key "h" 'evil-window-left)
(evil-leader/set-key "l" 'evil-window-right)
(evil-leader/set-key "q" 'save-buffers-kill-terminal)
(evil-leader/set-key "r" 'eval-region)

										; whitespace 모드

(require 'whitespace)
(setq whitespace-style '(face empty space-after-tab space-before-tab trailing))
(global-whitespace-mode t)

										; fill-column-indicator

(require 'fill-column-indicator)
(setq-default fill-column 100)
(add-hook 'find-file-hook #'fci-mode)

										; projectile

(projectile-global-mode)
(setq projectile-enable-caching t)

										; helm

(require 'helm-config)
(helm-mode 1)

										; spaceline

(require 'spaceline-config)
(spaceline-spacemacs-theme)
(setq spaceline-highlight-face-func #'spaceline-highlight-face-evil-state)

										; custom 모드

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
	("e87a2bd5abc8448f8676365692e908b709b93f2d3869c42a4371223aab7d9cf8" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(desktop-restore-eager 3)
 '(linum-format "%4d")
 '(omnisharp-server-executable-path
   "~/Downloads/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
 '(powerline-default-separator (quote arrow))
 '(powerline-height 20)
 '(tab-width 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:background "#2d2d2d" :foreground "#999999" :slant normal :height 0.7))))
 '(sp-show-pair-match-face ((t (:inherit default :underline (:color "yellow" :style wave))))))
										; 칼라 테마 (커스텀 보다 밑에 있어야 함)

(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow-eighties)

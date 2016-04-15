; 패키지 관리자
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

; 간단한 설정들
(setq make-backup-files nil)

; 폰트
(add-to-list 'default-frame-alist '(font . "Fira Code-14"))
(set-face-attribute 'default t :font "Fira Code-14")

(tool-bar-mode -1)

(desktop-save-mode 1)
;; (when window-system (set-frame-size (selected-frame) 110 80))

; vi 에뮬레이션
(require 'evil)
(evil-mode 1)

; elixir 모드
; alchemist
(unless (package-installed-p 'alchemist)
  (package-install 'alchemist))

(require 'elixir-mode)
(add-to-list 'elixir-mode-hook
             (defun auto-activate-ruby-end-mode-for-elixir-mode ()
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
(add-hook 'after-init-hook 'global-company-mode)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))

; c# 모드
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(add-hook 'csharp-mode-hook 'evil-smartparens-mode)

; 키보드
(evil-define-key 'normal omnisharp-mode-map (kbd "<f12>") 'omnisharp-go-to-definition)

; custom 모드
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
	("70b9c3d480948a3d007978b29e31d6ab9d7e259105d558c41f8b9532c13219aa" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" default)))
 '(fci-rule-color "#3E3D31")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
	(("#3E3D31" . 0)
	 ("#67930F" . 20)
	 ("#349B8D" . 30)
	 ("#21889B" . 50)
	 ("#968B26" . 60)
	 ("#A45E0A" . 70)
	 ("#A41F99" . 85)
	 ("#3E3D31" . 100))))
 '(magit-diff-use-overlays nil)
 '(omnisharp-server-executable-path
   "~/Downloads/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(tab-width 4)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
	((20 . "#F92672")
	 (40 . "#CF4F1F")
	 (60 . "#C26C0F")
	 (80 . "#E6DB74")
	 (100 . "#AB8C00")
	 (120 . "#A18F00")
	 (140 . "#989200")
	 (160 . "#8E9500")
	 (180 . "#A6E22E")
	 (200 . "#729A1E")
	 (220 . "#609C3C")
	 (240 . "#4E9D5B")
	 (260 . "#3C9F79")
	 (280 . "#A1EFE4")
	 (300 . "#299BA6")
	 (320 . "#2896B5")
	 (340 . "#2790C3")
	 (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#3E3D31" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; 칼라 테마 (커스텀 보다 밑에 있어야 함)
(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow-eighties)
;; (load-theme 'monokai t)
;(load-theme 'leuven t)


;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      ;; auto-completion-enable-snippets-in-popup t
                      ;; auto-completion-enable-help-tooltip t
                      )
     better-defaults
     emacs-lisp
     git
     ;; markdown
     org
     (shell :variables
            shell-default-shell 'eshell
            shell-default-term-shell "/bin/bash"
            shell-enable-smart-eshell t
            shell-default-height 50
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     osx
     csharp
     elixir
     themes-megapack
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(beacon editorconfig)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(ruby-end)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'random
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         spacemacs-light
                         spacemacs-dark
                         zenburn
                         gruvbox
                         monokai
                         tangotango
                         gotham
                         material
                         ample
                         lush
                         ;; moe-light
                         ;; moe-dark
                         sanityinc-tomorrow-eighties
                         leuven
                         solarized-light
                         solarized-dark
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Fira Code"
                               :size 14
                               :weight light
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido t
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'current
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq initial-frame-alist '((top . 30) (left . 700) (width . 212) (height . 81)))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (setq backup-by-copying t
        backup-directory-alist '(("." . "~/Downloads/backup")))
  (setq backward-delete-char-untabify-method nil)

  (setq spacemacs-show-trailing-whitespace nil
        whitespace-style '(face indentation empty space-after-tab space-before-tab trailing lines-tail)
        whitespace-line-column 100)

  (global-whitespace-mode 1)

  (show-smartparens-global-mode -1)
  (sp-pair "(" ")" :unless '(sp-point-before-symbol-p sp-point-before-word-p))
  (sp-pair "{" "}" :unless '(sp-point-before-symbol-p sp-point-before-word-p))
  (sp-pair "[" "]" :unless '(sp-point-before-symbol-p sp-point-before-word-p))

  ;; {를 누르면 기다렸다가 RET을 누르면 }를 자동 입력하고 한 줄을 띄운다
  (sp-local-pair 'csharp-mode "{" "}" :when '(("SPC" "RET" "<evil-ret>")))
  (sp-local-pair 'csharp-mode "{" nil :post-handlers '(:add my-open-block))

  ;; do를 입력하면 기다렸다가 RET을 누르면 end를 자동입력하고 한 줄 띄운다
  (sp-local-pair 'elixir-mode "do" "end" :when '(("SPC" "RET" "<evil-ret>")))
  (sp-local-pair 'elixir-mode "do" nil :post-handlers '(:add my-open-block))

  (setq-default evil-escape-key-sequence "fj")
  (setq-default evil-escape-delay 0.4)

  ;; (mac-auto-operator-composition-mode 1)
  (setq-default line-spacing 2)
  (add-hook 'focus-out-hook 'my-save)

  ;; (setq spaceline-show-default-input-method t)
  (beacon-mode 1)
  ;; (spacemacs/toggle-golden-ratio-on)
  (setq projectile-globally-ignored-file-suffixes
        '(".png" ".mat" ".controller" ".meta" ".anim" ".FBX" ".fbx" ".prefab" ".WAV" ".wav"
          ".asset" ".tga" ".dds" ".overrideController" ".psd" ".shader"))
  ;; line number
  ;; (add-hook 'text-mode-hook 'nlinum-mode)
  ;; (add-hook 'prog-mode-hook 'nlinum-mode)
  ;; (setq linum-format "%4d")

  ;; (set-face-attribute 'linum nil :height 0.8)

  ;; helm
  (add-hook 'helm-mode-hook 'my-helm-mode)

  ;; elixir
  (add-hook 'elixir-mode-hook 'my-elixir-mode)

  ;; c#
  (setq omnisharp-server-executable-path
        "~/Downloads/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
  (add-hook 'csharp-mode-hook 'my-csharp-mode)
  (add-hook 'omnisharp-mode-hook 'my-omnisharp-mode)

  ;; diminish
  (diminish 'beacon-mode "🄱")
  (diminish 'hybrid-mode "🄷")
  (add-hook 'alchemist-mode-hook (lambda ()
                                   (diminish 'alchemist-mode "🅰")))
  (add-hook 'omnisharp-mode-hook (lambda ()
                                   (diminish 'omnisharp-mode "🅾")))

  ;; random theme
  ;; (run-with-timer 1 (* 60 60) 'my-random-color-theme)

  (global-set-key (kbd "s-\\") 'my-split-window)
  (global-set-key (kbd "s-/") 'spacemacs/comment-or-uncomment-lines)

  (global-set-key (kbd "s-1") 'select-window-1)
  (global-set-key (kbd "s-2") 'select-window-2)
  (global-set-key (kbd "s-3") 'select-window-3)
  (global-set-key (kbd "s-4") 'select-window-4)
  (global-set-key (kbd "s-8") 'spacemacs/enter-ahs-forward)
  (global-set-key (kbd "s-*") 'spacemacs/helm-project-smart-do-search-region-or-symbol)

  (global-set-key (kbd "s-=") 'indent-region)

  (global-set-key (kbd "s-b") 'helm-buffers-list)
  (global-set-key (kbd "s-f") 'isearch-forward)
  (global-set-key (kbd "s-k") 'kill-this-buffer)
  (global-set-key (kbd "s-K") 'spacemacs/kill-other-buffers)
  (global-set-key (kbd "s-l") 'sublime-text-control-l)
  (global-set-key (kbd "s-p") 'helm-projectile)
  (global-set-key (kbd "s-t") 'neotree-find-project-root)
  (global-set-key (kbd "s-T") 'my-random-color-theme)

  (global-set-key (kbd "<f4>") 'my-next-error)
  (global-set-key (kbd "S-<f4>") 'my-prev-error)
  (global-unset-key (kbd "<f11>"))

  (global-set-key (kbd "<home>") 'spacemacs/smart-move-beginning-of-line)

  (define-key evil-normal-state-map [escape] 'my-close-window)
  (define-key isearch-mode-map (kbd "s-f") 'isearch-repeat-forward)
  (define-key isearch-mode-map (kbd "s-F") 'isearch-repeat-backward)
  )

(defun my-open-block (id action context)
  (when (eq action 'insert)
    (newline)
    (indent-according-to-mode)
    (previous-line)
    (indent-according-to-mode)))

(defun my-split-window ()
  (interactive)
  (delete-other-windows)
  (split-window-right)
  (evil-window-right 1))

(defun my-close-window ()
  "현재 윈도 개수에 따라 마지막 윈도를 닫는다"
  (interactive)
  (let ((num-win (length (window-list))))
    (cond
     ((= num-win 4)
      (select-window-4)
      (delete-window))
     ((= num-win 3)
      (select-window-3)
      (delete-window))
     ((= num-win 2)
      (select-window-2)
      (delete-window)))))

(defun my-prev-error ()
  (interactive)
  (spacemacs/toggle-syntax-checking-on)
  (spacemacs/previous-error))

(defun my-next-error ()
  (interactive)
  (spacemacs/toggle-syntax-checking-on)
  (spacemacs/next-error))

(defun my-elixir-mode ()
  (add-to-list 'compilation-error-regexp-alist 'elixir)
  (add-to-list 'compilation-error-regexp-alist-alist
               '(elixir
                 "\\*\\* (CompileError) \\(.+?\\):\\([0-9]+\\): .*" 1 2))
  (add-to-list 'compilation-error-regexp-alist-alist
               '(elixir
                 " *(.+?) \\(.+?\\):\\([0-9]+\\): .*" 1 2))
  (define-key elixir-mode-map (kbd "s-=") 'my-indent-align)
  (define-key elixir-mode-map (kbd "<f4>") 'next-error)
  (define-key elixir-mode-map (kbd "<f9>") 'my-mix-compile)
  (define-key elixir-mode-map (kbd "S-<f9>") 'my-mix-c)
  (define-key elixir-mode-map (kbd "<f11>") 'my-correct-alchemist)
  (define-key elixir-mode-map (kbd "<f12>") 'alchemist-goto-definition-at-point))

(defun my-indent-align ()
  (interactive)
  (save-excursion
    (if (not (region-active-p))
        (let ((near (my-find-nearest-region
                     '(("\\<with\\>" . "\\<do\\>") ("\\<do\\>" . "\\<end\\>")))))
          (my-indent-align-region near)
          (message (format "point %s region %s" (point) near)))
      (my-indent-align-region (cons  (region-beginning) (region-end))))))

(defun my-find-nearest-region (pairs)
  (let ((regions (mapcar 'my-find-region pairs))
        (near '(0 . 0)))
    (dolist (region regions near)
      (if (and (< (car region) (point)) (< (point) (cdr region)) (< (car near) (car region)))
          (setq near region)))))

(defun my-find-region (pair)
  (save-excursion
    (let ((beg (search-backward-regexp (car pair) 0 t))
          (end (search-forward-regexp (cdr pair))))
      (if beg
          (cons beg end)
        '(0 . 0)))))

(defun my-indent-align-region (region)
  (indent-region (car region) (cdr region))
  (align-regexp (car region) (cdr region) "\\(\\s-*\\)\\(->\\|<-\\|'\\)"))

(defun my-mix-compile ()
  (interactive)
  (save-some-buffers t)
  (let ((default-directory "~/work/q5/program/server/"))
    (compile "mix test --no-color")))

(defun my-test ()
  (interactive)
  (save-some-buffers t)
  (alchemist-mix-test))

(defun my-mix-c ()
  (interactive)
  (save-some-buffers t)
  (alchemist-mix-execute (list "c")))

(defun my-csharp-mode ()
  (define-key csharp-mode-map (kbd "<f9>") 'my-compile)
  (define-key csharp-mode-map (kbd "<f12>") 'omnisharp-go-to-definition-other-window)
  (define-key csharp-mode-map (kbd "M-<f12>") 'omnisharp-go-to-definition)
  (define-key csharp-mode-map (kbd "S-<f12>") 'omnisharp-helm-find-usages)
  (setq csharp-want-imenu nil)
  (setq tab-width 4)
  (setq tab-stop-list (number-sequence 4 200 4))
  (setq indent-tabs-mode t)
  (setq whitespace-style '(face empty space-before-tab space-after-tab trailing lines-tail))
  ;; (font-lock-add-keywords nil my-extra-whitespace)
  )

(defun my-compile ()
  (interactive)
  (save-some-buffers t)
  (omnisharp-build-in-emacs))

(defun my-omnisharp-mode ()
  (dolist (proc (process-list))
    (set-process-query-on-exit-flag proc nil)))

(defun my-whitespace-mode-local ()
  (add-hook 'hack-local-variables-hook 'whitespace-mode nil 'local))

(defun my-save ()
  "고쳐진 모든 버퍼를 저장한다."
  (interactive)
  (save-some-buffers t))

(defvar my-extra-whitespace
  '(("^ +" . 'trailing-whitespace)
    ("\t \\{4,\\}" . 'trailing-whitespace)
    ("\t +\t" . 'trailing-whitespace)))

(defun my-helm-mode ()
  (define-key helm-map (kbd "s-d") 'my-kill-buffer)
  )

(defun my-kill-buffer ()
  "물어보지 않고 버퍼를 없앰"
  (interactive)
  (let ((marked (helm-marked-candidates)))
    (unwind-protect
        (cl-loop for b in marked
                 do (progn (helm-buffers-persistent-kill-1 b)))
      (with-helm-buffer
        (setq helm-marked-candidates nil
              helm-visible-mark-overlays nil))
      (helm-force-update (helm-buffers--quote-truncated-buffer
                          (helm-get-selection))))))

(defun my-correct-alchemist ()
  (interactive)
  (kill-buffer "*alchemist-server*")
  (find-file "~/work/q5/program/server/mix.exs"))

(defun my-random-color-theme ()
  "랜덤 테마를 표시한다"
  (interactive)
  ;; (random t)
  (setq theme (nth (random (length dotspacemacs-themes)) dotspacemacs-themes))
  (message "%s" theme)
  (spacemacs/load-theme theme)
  (if (or (eq theme 'moe-light)
          (eq theme 'moe-dark))
      (moe-theme-random-color)))

(defun sublime-text-control-l ()
  (interactive)
  (when (not (region-active-p))
    (move-beginning-of-line nil)
    (set-mark (point))
    (activate-mark))
  (move-beginning-of-line 2))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (alert log4e gntp solarized-theme zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme nlinum niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme editorconfig dracula-theme django-theme darktooth-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme beacon badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme moe-theme xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package toc-org spacemacs-theme spaceline smooth-scrolling smeargle shell-pop ruby-end reveal-in-osx-finder restart-emacs rainbow-delimiters quelpa popwin persp-mode pcre2el pbcopy paradox page-break-lines osx-trash orgit org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file omnisharp neotree multi-term move-text magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme launchctl info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ flycheck-pos-tip flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu eshell-prompt-extras esh-help elisp-slime-nav diff-hl define-word company-statistics company-quickhelp clean-aindent-mode buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-compile alchemist aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell))))

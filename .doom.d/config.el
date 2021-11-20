;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Josh Mix"
      user-mail-address "josh.mix@blockfi.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-font (font-spec :family "Fira Code" :size 9))
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(add-to-list 'company-backends #'company-tabnine)
;; (add-hook 'elixir-mode-hook
;;     (lambda ()                          ;
;;       (setq lsp-flycheck-live-reporting 1)
;;       (setq-local flycheck-check-syntax-automatically nil)
;;       )
;;     )

;;   (add-hook 'lsp-after-initialize-hook
;;             (lambda ()
;;               (lsp--set-configuration `(:elixirLS, lsp-elixir--config-options))
;;               (elixir/init-flycheck-credo)
;;               (flycheck-add-next-checker 'lsp 'elixir-credo)))
;; package config
(use-package! exunit
  :hook (elixir-mode . exunit-mode))
(use-package! forge
  :config (setq forge-topic-list-limit '(10 . 0)))
(use-package! lsp-mode
  :hook (elixir-mode . lsp)
  :init (setq lsp-elixir-dialyzer-enabled nil
              lsp-elixir-project-dir ""))
(use-package! mix
  :hook (elixir-mode . mix-minor-mode)
  :config (setq compilation-scroll-output t))
;; (use-package! popwin
;;   :hook (elixir-mode . popwin-mode)
;;   :config
;;   (let ((buffer-pattern "\\*Flycheck*\\|\\*exunit-*\\|\\*mix ex*"))
;;     (push `(,buffer-pattern
;;             :regexp t
;;             :dedicated t
;;             :stick t
;;             :noselect t
;;             :position right
;;             :width 0.30)
;;           popwin:special-display-config)
;;     (push '("magit\\:*"
;;             :regexp t
;;             :position right
;;             :width 0.30)
;;           popwin:special-display-config)))
;; package hooks
(after! lsp-clients
  (let ((ignore-list (append lsp-file-watch-ignored '("deps/" "_build/" ".elixir_ls/" "assets/" "docs/"))))
    (setq lsp-file-watch-ignored ignore-list)))
(after! lsp-ui
  (setq lsp-ui-doc-enable nil
        lsp-ui-doc-delay 1.5
        lsp-ui-doc-max-height 20
        lsp-ui-doc-max-width 80
        lsp-ui-doc-use-childframe t
        lsp-ui-doc-position 'top
        lsp-ui-doc-use-webkit nil
        lsp-ui-sideline-ignore-duplicate t))

;;; ~/dotfiles/config/doom/+keybindings.el -*- lexical-binding: t; -*-

;; Fix C-h backspace keybind
(map! (:map (minibuffer-local-map
             minibuffer-local-ns-map
             minibuffer-local-completion-map
             minibuffer-local-must-match-map
             minibuffer-local-isearch-map
             read-expression-map)
        "C-h" #'backward-delete-char-untabify)

      (:after evil
        :map evil-ex-completion-map
        "C-h" #'backward-delete-char-untabify)

      ;; If you use :completion ivy
      (:after ivy
        :map ivy-minibuffer-map
        "C-h" #'backward-delete-char-untabify)

      ;; If you use :completion helm
      (:after helm
        :map helm-map
        "C-h" #'backward-delete-char-untabify))


(map!
    ;; Make C-h delete-backward-char
    :ie "C-h" #'backward-delete-char-untabify

    ;; Find files within a git repository
    :n "C-x f" #'projectile-find-file

    ;; Move ag/rg/grep search to more familiar keybind
    :n "C-x a" #'+helm/project-search

    ;; --- <leader> -------------------------------------
    (:leader
        :desc "Write file"              :n "s"  #'save-buffer)
    )

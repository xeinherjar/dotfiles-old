;; keybindings

(map!
  ;; Beter Vim window movement
  "C-h"  #'evil-window-left
  "C-j"  #'evil-window-down
  "C-k"  #'evil-window-up
  "C-l"  #'evil-window-right

(:after org
  :map org-mode-map
    :n "M-j" #'org-metadown
    :n "M-k" #'org-metaup))

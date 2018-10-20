;;;;                                                                                                                                        
;; Created by Bitcoin_O_Plomo                                                                                                               
;;                                                                                                                                          
;; PGP 0xAD1B89091B9706E8                                                                                                                   
;;                                                                                                                                          
;; Some packages will not be installed by the init.el                                                                                       
;; So you will need to install them manually                                                                                                
;;                                                                                                                                          
;; end

;;;;  Package 
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; Higher values are searched first.
(setq package-archive-priorities
      '(("org"          . 200)
        ("melpa-stable" . 150)
        ("melpa"        . 100)
        ("marmalade" . 75)
        ("gnu"          .  50)))

(setq package-enable-at-startup t)
(package-initialize)
;; end Package 

;;;;  Evil Mode
(use-package evil                                                                                                               
  :ensure t                                                                                                                                 
  :init) 
(evil-mode t)
;; end Evil Mode

;;;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
;; end  use-package

;;;; Themes and Screen Settings
;; Splash screen
(defun use-fancy-splash-screens-p ()
  "Return t if fancy splash screens should be used."
  (when (and (display-graphic-p)
             (or (and (display-color-p)
          (image-type-available-p 'xpm))
                 (image-type-available-p 'pbm)))
    (let ((frame (fancy-splash-frame)))
      (when frame
  (let* ((img (create-image (fancy-splash-image-file)))
         (image-height (and img (cdr (image-size img nil frame))))
         ;; We test frame-height so that, if the frame is split
         ;; by displaying a warning, that doesn't cause the normal
         ;; splash screen to be used.
         (frame-height (1- (frame-height frame))))
   ;; The original value added to the `image-height' for the test was 19; however,
   ;; that causes the test to fail on X11 by about 1.5 -- so use 17 instead.
    (> frame-height (+ image-height 17)))))))

(load-theme 'tango-dark)

(tool-bar-mode -1)

(menu-bar-mode -1)

(use-package smart-mode-line
  :ensure t                                                                                                                                 
  :init)
(setq sml/theme 'dark)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(setq display-time-format "%a %d %b %R")
(display-time-mode 1)
(setq column-number-mode t)

;; end Themes and Screen Settings

;;;;Org mode configuration
;; Enable Org mode
(use-package org
  :ensure t                                                                                                                                 
  :init)

;; Publishing and task management with Org-mode
;; Display preferences

;; I like to see an outline of pretty bullets instead of a list of asterisks.
(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))

;; I like seeing a little downward-pointing arrow instead of the usual ellipsis (...) that org displays when there’s stuff under a header.
(setq org-ellipsis "⤵")

;; Use syntax highlighting in source blocks while editing.
(setq org-src-fontify-natively t)

;; Make TAB act as if it were issued in a buffer of the language’s major mode.
(setq org-src-tab-acts-natively t)

;;When editing a code snippet, use the current window rather than popping open a new one (which shows the same information).
(setq org-src-window-setup 'current-window)

;; Quickly insert a block of elisp:
(add-to-list 'org-structure-template-alist
             '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

;; Enable spell-checking in Org-mode.
(add-hook 'org-mode-hook 'flyspell-mode)

;; Hitting C-c C-x C-s will mark a todo as done and move it to an appropriate place in the archive.
(defun hrs/mark-done-and-archive ()
  "Mark the state of an org-mode item as DONE and archive it."
  (interactive)
  (org-todo 'done)
  (org-archive-subtree))
  (define-key org-mode-map (kbd "C-c C-x C-s") 'hrs/mark-done-and-archive)

;; Record the time that a todo was archived.
(setq org-log-done 'time)

;; Store a quick note in the LOGBOOK drawer 
(setq org-log-into-drawer t)

;; Time tracking settings 
(setq org-clock-into-drawer "CLOCKING")

;; Org-mode LaTeX export 
(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")))

;; PDFs visited in Org-mode are opened in zathurae (and not in the default choice) https://stackoverflow.com/a/8836108/789593
(add-hook 'org-mode-hook
      '(lambda ()
         (delete '("\\.pdf\\'" . default) org-file-apps)
         (add-to-list 'org-file-apps '("\\.pdf\\'" . "zathura %s"))))

;; enforce to not split window horizontally                                                                                               
;; (setq split-width-threshold nil) 

;; TODO entries that cannot be closed because of such dependencies will be shown in a dimmed font or even made invisible in agenda views
(setq org-agenda-dim-blocked-tasks t)

;; This is for org-mode agenda view activation
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; This is for key bindings to invoke agenda mode (see line-2)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; Capture 
 (global-set-key (kbd"<f6>") 'org-capture)


;; The purpose of this code is that it creates ID properties for every headline (if there isn’t one already) when you save your OrgMode file.
(defun my/org-add-ids-to-headlines-in-file ()
  "Add ID properties to all headlines in the current file which do not already have one."
  (interactive)
  (org-map-entries 'org-id-get-create))

(add-hook 'org-mode-hook
	  (lambda ()
	    (add-hook 'before-save-hook 'my/org-add-ids-to-headlines-in-file nil 'local)))

;; This function is bound to the F5 key. Whenever you press F5 then it takes the ID and copies it to the killring (aka Clipboard). If the headline has no ID property it creates one. In that way, you can easily create links to IDs because copying the ID is just one keystroke.
(defun my/copy-id-to-clipboard() "Copy the ID property value to killring,
if no ID is there then create a new unique ID. 
This function works only in org-mode buffers.

The purpose of this function is to easily construct id:-links to 
org-mode items. If its assigned to a key it saves you marking the
text and copying to the killring."
       (interactive)
       (when (eq major-mode 'org-mode) ; do this only in org-mode buffers
	 (setq mytmpid (funcall 'org-id-get-create))
	 (kill-new mytmpid)
	 (message "Copied %s to killring (clipboard)" mytmpid)
	 ))

(global-set-key (kbd "<f5>") 'my/copy-id-to-clipboard)

;; You can change what face is used to display bold (or any other) markup by adding a new entry to org-emphasis-alist. 
;; For example, to make *bold* display in red, use
(add-to-list 'org-emphasis-alist '("*" (:foreground "red") ))
(add-to-list 'org-emphasis-alist '("/" (:foreground "grey") ))

;; Refresh org agenda if open after saving 
;;
(defun plomo:org-agenda-redo ()
  (interactive) 
  (when (get-buffer "*Org Agenda*")  
    (with-current-buffer "*Org Agenda*" 
                         (org-agenda-maybe-redo) 
                         (message "[org agenda] refreshed!"))))

(add-hook 'after-save-hook 'plomo:org-agenda-redo) 

(run-at-time "1 min" 60 'plomo:org-agenda-redo)

(add-hook 'org-mode-hook 'turn-on-auto-fill)

;;;; Desktop notifications 
;;
;; Define popup window using libnotify and play sound using mplayer
(defun djcb-popup (title msg &optional icon sound)
  "Show a popup if we're on X, or echo it otherwise; TITLE is the title
of the message, MSG is the context. Optionally, you can provide an ICON and
a sound to be played"

  (interactive)
  (when sound (shell-command
                (concat "mplayer -really-quiet " sound " 2> /dev/null")))
  (if (eq window-system 'x)
    (shell-command (concat "notify-send "

                     (if icon (concat "-i " icon) "")
                     " '" title "' '" msg "'"))
    ;; text only version

    (message (concat title ": " msg))))

;; the appointment notification facility
(require 'appt)
(setq appt-time-msg-list nil)    ;; clear existing appt list
(setq appt-display-interval '5) ;; warn every 5 minutes from t - appt-message-warning-time
(setq
  appt-message-warning-time '15  ;; send first warning 15 minutes before appointment
  appt-display-mode-line nil     ;; don't show in the modeline
  appt-display-format 'window)   ;; pass warnings to the designated window function
(appt-activate 1)                ;; activate appointment notification
(display-time)                   ;; activate time display

(org-agenda-to-appt)             ;; generate the appt list from org agenda files on emacs launch
(run-at-time "1 min" 300 'org-agenda-to-appt)           ;; update appt list every 5 minutes
(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt) ;; update appt list on agenda view

;; send args and image to window popup and soud to play
 (defun djcb-appt-display (min-to-app new-time msg)
    (djcb-popup (format "Appointment in %s minute(s)" min-to-app) msg 
      "~/.emacs.d/org_mode_icon.png"

      "~/.emacs.d/oringz-w423.ogg"))
  (setq appt-disp-window-function (function djcb-appt-display))


;; end Org mode configuration

;;;; Helm
(use-package helm
  :ensure t
  :init 
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files))
;; end  Helm

;;;; flyspell
;; enable flyspell for text files
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))

;; It also comes with flyspell-prog-mode which is useful when programming since it only checks comments and strings. It has a fairly low signal-to-noise ration if left unconfigured, but it can be useful if you believe comments should be sentences. I have enabled it for most of my day-to-day tools: 
(dolist (mode '(emacs-lisp-mode-hook
                inferior-lisp-mode-hook
                clojure-mode-hook
                python-mode-hook
                js-mode-hook
                R-mode-hook))
  (add-hook mode
            '(lambda ()
               (flyspell-prog-mode))))

;; recommended shortcuts
(global-set-key (kbd "<f8>") 'ispell-word)
(defun flyspell-check-next-highlighted-word ()
  "Custom function to spell check next highlighted word"
  (interactive)
  (flyspell-goto-next-error)
  (ispell-word))
(global-set-key (kbd "M-<f8>") 'flyspell-check-next-highlighted-word)

(global-set-key [f3] (lambda () (interactive) (ispell-change-dictionary "portuguese")))
(global-set-key [f4] (lambda () (interactive) (ispell-change-dictionary "english")))
;; end flyspell

;;;; Set firefox as default browser
;;
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "/usr/bin/firefox")  
;; end Set firefox as default browser


;;;; LaTeX configuration
;; This is the configuration I use for fine-tuning AUCTeX (use pdflatex by default, use RefTeX, configure viewers, enable writegood-mode)
;;
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq TeX-PDF-mode t)
(setq TeX-show-compilation nil)

(eval-after-load "tex-mode"
    '(add-to-list 'tex-compile-commands 			'("pdflatex -synctex=1 -interaction=nonstopmode %r.tex")))
;; end LaTeX configuration


;;;; Markdown configuration
;;
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; end Markdown configuration


;;;;  undo tree mode                                 
;;
(use-package undo-tree
  :ensure t                                                                                                                                 
  :init  
  (global-undo-tree-mode))

;; end undo tree mode

;;;; Settings for coding  
;; 
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;

;;;; other shortcuts
;;
(global-set-key (kbd "<f12>") 'browse-url)

;; End other shortcuts




;;;; Do not write anything past this comment. This is where Emacs will
;;;; auto-generate custom variable definitions.   

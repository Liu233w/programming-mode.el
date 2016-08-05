;;; programming-mode.el

;;; author: Liu233w

;;; Copyright (c) 2016 Liu233w. All rights reserved.
;;; Work in progress,not completed.

(defconst programming-mode--key-translation
  '(
    ("1" . "!")
    ("2" . "@")
    ("3" . "#")
    ("4" . "$")
    ("5" . "%")
    ("6" . "^")
    ("7" . "&")
    ("8" . "*")
    ("9" . "(")
    ("0" . ")")
    )
  "Define which keys to translate.")

(defvar after-programming-mode-hook
  nil
  "a hook which will run after minor mode is started")

(define-minor-mode programming-mode
  "A minor mode which swap the key in your number line with the symbol above"
  nil
  "EP"
  nil
  :after-hook after-programming-mode-hook
  )

;;; from https://www.emacswiki.org/emacs/Evil
(defun make-conditional-key-translation (key-from key-to translate-keys-p)
  "Make a Key Translation such that if the translate-keys-p function returns true,
 key-from translates to key-to, else key-from translates to itself.  translate-keys-p
 takes key-from as an argument. "
  (define-key key-translation-map key-from
    `(lambda (prompt)
       (if (funcall (quote ,translate-keys-p) ,key-from) ,key-to ,key-from))))

(defvar programming-mode--translation-condition
  '(and
    programming-mode)
  "A form to test if it should translate keys. It shouldn't be edited by hand,
but should be edited by function `programming-mode-add-translation-condition'")

(defun programming-mode--refresh-translation-condition ()
  "Redefine a function `programming-mode--translate-keys-p' to test if it should
remap keys. The function is defined by the form in `programming-mode--translation-condition'."
  (eval
   `(defun programming-mode--translate-key-p (key-from)
      "Returns whether conditional key translations should be active."
      ,programming-mode--translation-condition)))

(defun programming-mode-add-translation-condition (forms)
  "Argument is a list of forms to test whether conditional key translations
should be active. The function will add them to `programming-mode--translation-condition'
and then call `programming-mode--refresh-translation-condition' to redefine
`programming-mode--translate-key-p'.
Variable `key-form' means the key you press to call `programming-mode--translate-key-p'.

Example:
(programming-mode-add-translation-condition
 (evil-insert-state-p))
It will test if insert state (defined by evil) is actived.

Example2:
(programming-mode-add-translation-condition
 (not (evil-normal-state-p)))
Add a condition that not in normal state."
(setq programming-mode--refresh-translation-condition
      (nconc programming-mode--translation-condition forms))
(programming-mode--refresh-translation-condition))

(defun programming-mode-add-key-translation (from to)
  "Add a Key Translation to `key-translation-map'"
  (make-conditional-key-translation from to 'programming-mode--translate-key-p))

(defun programming-mode-setup ()
  "Setup programming-mode by add the keys defined in `programming-mode--key-translation'
into `key-translation-map'. Before that, refresh the predicate function
`programming-mode--translate-key-p'."
  (interactive)
  (programming-mode--refresh-translation-condition)
  (dolist (i programming-mode--key-translation)
    (programming-mode-add-key-translation (car i) (cdr i))
    (programming-mode-add-key-translation (cdr i) (car i))))

(defun programming-mode-setup-evil-mode ()
  "Setup key mapping for evil. Will call `programming-mode-setup' last."
  (interactive)
  (programming-mode-add-translation-condition
   `((evil-insert-state-p)))
  (programming-mode-setup)
  )

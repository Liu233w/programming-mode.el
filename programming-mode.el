;;; programming-mode.el -- Input method to exchange your number line with the mark above it.
;;
;; Copyright © 2016 Liu233w
;;
;; Author: Liu233w <wwwlsmcom@outlook.com>
;; URL: https://github.com/Liu233w/programming-mode.el
;; Version: 0.1.0
;; Keywords: input-method keyboard

;; This file is not part of GNU Emacs.

;;; Commentary:

;; It's a input method to exchange your number line with the mark above it.
;; For example, when you press `1', `!' will be entered.
;; Pressing `S+1' will enter `1', etc.
;; It's a input method, so it's only worked on insert mode in current buffer,
;; so chords like `C-x 2' will act as normal, and the key won't be translated
;; in minibuffer.

;;; License: GPLv3

;;; Code:
(require 'quail)

(quail-define-package
 "programming-mode" "English" "&" t
 "Press `1' to enter `!',
Press `S+1' to enter `1' instead, etc."
 nil t t t t nil nil nil nil nil t)

(quail-define-rules
 ("1" ?!)
 ("2" ?@)
 ("3" ?#)
 ("4" ?$)
 ("5" ?%)
 ("6" ?^)
 ("7" ?&)
 ("8" ?*)
 ("9" ?\()
 ("0" ?\))
 ("!" ?1)
 ("@" ?2)
 ("#" ?3)
 ("$" ?4)
 ("%" ?5)
 ("^" ?6)
 ("&" ?7)
 ("*" ?8)
 ("(" ?9)
 (")" ?0))

(provide 'programming-mode)
;;; programming-mode.el ends here

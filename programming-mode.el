;;; programming-mode.el --- Exchange your number line with the mark above it.

;; Copyright (C) 2016 Liu233w

;; Author: Liu233w <wwwlsmcom@outlook.com>
;; URL: https://github.com/Liu233w/programming-mode.el
;; Version: 0.1.2
;; Keywords: convenience
;; Package-Requires: ((emacs "24"))

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; It's a input method to exchange your number line with the mark above it.
;; For example, when you press `1', `!' will be entered.
;; If `!' was binding to function other than `self-insert-command', it will be
;; called.  But if Emacs have evil installed, it's only worked at insert-state.
;; Pressing `S+1' will enter `1', etc.
;; It's a input method, so it's only worked on insert mode in current buffer,
;; so chords like `C-x 2' will act as normal, and the key won't be translated
;; in minibuffer.

;;; Code:

(require 'quail)

(quail-define-package
 "programming-mode" "English" "&" t
 "Press `1' will behave like press `!'.
Press `S+1' as `1' instead, etc."
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

(defvar programming-mode--last-input-method
  nil
  "Last input method.
Should be as a locale variavle and be modified by
`programming-mode-toggle-programming-mode'")

;;;###autoload
(defun programming-mode-toggle-programming-mode ()
  "Toggle programming-mode and last nearest input method."
  (interactive)
  (make-local-variable 'programming-mode--last-input-method)
  (if (eql default-input-method 'programming-mode)
      (set-input-method programming-mode--last-input-method)
    (setq programming-mode--last-input-method default-input-method)
    (set-input-method 'programming-mode)))

(provide 'programming-mode)
;;; programming-mode.el ends here

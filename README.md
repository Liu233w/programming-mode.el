# programming-mode.el
Input method to exchange your number line with the mark above it

## Installation and Usage
Add `programming-mode.el` to your load-path and then `(require 'programming-mode)`.
It will become one of your input method. Use `M-x set-input-method` to change to it
and `C-\\` to enable it, then there will be a `&` in your modeline.

If you don't use other input methods, just put the code below into your config file:
``` emacs-lisp
(set-input-method 'programming-mode)
```

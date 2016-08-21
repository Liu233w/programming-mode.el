# programming-mode.el
Input method to exchange your number line with the mark above it.

中文说明： http://liu233w.github.io/blog/2016/08/21/%E5%86%99%E4%BA%86%E4%B8%80%E4%B8%AA-emacs-package%EF%BC%9Aprogramming-mode.el/

## Installation
Add `programming-mode.el` to your load-path and then `(require 'programming-mode)`.
If you use spacemacs, just add following codes into your configuration layer's variable
<layer>-packages:
``` emacs-lisp
(programming-mode
 :location (recipe
            :repo "Liu233w/programming-mode.el"
            :fetcher github))
```

## Usage
It will become one of your input method. Use `M-x set-input-method` to change to it
and `C-\` to enable it, then there will be a `&` in your modeline.

If you don't use other input methods, just put the code below into your config file:
``` emacs-lisp
(set-input-method 'programming-mode)
```

If you use other input method, you can switch between it and programming-mode by function
`programming-mode-toggle-programming-mode`.

# _custom: your changes to the look of the book

`_support` holds the files of Pillar (templates, style sheets, fonts, LaTeX classes).
`pillar updateArchetype` replaces it with the newest version, so **do not edit `_support`**: put your changes here.
This folder is never changed by Pillar.

`_custom` has the same layout as `_support`. When the book is built, Pillar copies `_support` into the output, then
the files of `_custom` over it (except this README).

## Add to the style (preferred)

- `html/css/custom.css`: CSS rules loaded after `book.css`, for `pillar build html` and `pillar build site`.
  Write only the rules you change. An example is in this folder: every rule is commented out.
- `latex/custom.tex`: LaTeX read at the end of the preamble, for `pillar build pdf` (books and slides):
  your macros and package options.

Pillar keeps updating `book.css` and the LaTeX classes, and your additions stay on top of them.

## Replace a file

Copy a file of `_support` to the same path here and change the copy, for example
`templates/html/site.mustache` to change the structure of the web pages.
The copy always wins, even after an update: compare it with the new version in `_support` from time to time.
Do this only when an addition is not enough.

## More

See the documentation of Pillar: `doc/book-layout.md` and `doc/commands.md` in
https://github.com/pillar-markup/pillar

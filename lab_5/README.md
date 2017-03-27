# Vim basics

## Navigation
* `h`, `j`, `k`, `l` — equivalent to arrows
* `Shift + G` — jump to the end of file (you can also use `100%`)
* `gg` — jump to the start of the file
* `5G` — go to line 5
* `$` — move to the end of the line.
* `0` — move to the beginning of the line.
* `w` — move forward to the beginning of a word.
* `b` — move backward to the beginning of a word.
* `$` — move to the end of the line.
* `0` — move to the beginning of the line.
zz — center cursor on screen
Ctrl + b — move back one full screen
Ctrl + f — move forward one full screen

## Insert
`i` — insert before the cursor
`I` — insert at the beginning of the line
`a` — append after the cursor
`A` — append at the end of the line
`o` — append (open) a new line below the current line
`O` — append (open) a new line above the current line
`ea` — insert (append) at the end of the word
`Esc` — exit insert mode

## Editing
`r` — replace a single character
`cc` — change (replace) entire line
`cw` — change (replace) to the end of the word
`yy` — yank (copy) a line
`dd` — delete (cut) a line
`dw` — delete (cut) the characters of the word from the cursor position to the start of the next word
`p` — put (paste) the clipboard after cursor
`P` — put (paste) before cursor
`u` — undo
`.` — repeat last command

## Searching
`/pattern` — search for pattern
`n` — repeat search in same direction
`N` — repeat search in opposite direction
`:%s/old/new/g` — replace all old with new throughout file

## Exiting
`:w` — write (save) the file, but don't exit
`:wq` — write the file regardless if there were any changes (so it always updates timestamp) and exit
`:x` — write the file only if there were changes and exit
`:q` — quit (fails if there are unsaved changes)
`:q!` — force-quit

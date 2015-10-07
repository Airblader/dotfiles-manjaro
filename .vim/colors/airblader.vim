set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "airblader"

hi Normal       ctermfg=252 ctermbg=0   cterm=NONE

" Search
hi IncSearch    ctermfg=0   ctermbg=3   cterm=NONE
hi Search       ctermfg=0   ctermbg=3   cterm=NONE

" Messages
" TODO

" Cursor
hi Cursor       ctermfg=252 ctermbg=235 cterm=NONE
hi CursorLine               ctermbg=233 cterm=NONE
hi CursorLineNr ctermfg=3   ctermbg=233 cterm=NONE

" Syntax group
hi Comment      ctermfg=242 ctermbg=0   cterm=ITALIC
hi Constant     ctermfg=9   ctermbg=0   cterm=NONE
hi Error        ctermfg=252 ctermbg=0   cterm=NONE
hi Identifier   ctermfg=11  ctermbg=0   cterm=NONE
hi Ignore       ctermfg=1   ctermbg=1   cterm=NONE
hi PreProc      ctermfg=145 ctermbg=0   cterm=NONE
hi Special      ctermfg=107 ctermbg=0   cterm=NONE
hi Statement    ctermfg=74  ctermbg=0   cterm=NONE
hi Todo         ctermfg=1   ctermbg=0   cterm=BOLD
hi Type         ctermfg=3   ctermbg=0   cterm=NONE
hi Underlined                           cterm=UNDERLINE
hi Include      ctermfg=145 ctermbg=0   cterm=NONE
hi Conditional  ctermfg=74  ctermbg=0   cterm=NONE
hi String       ctermfg=107 ctermbg=0   cterm=NONE

" Other
hi Directory    ctermfg=252 ctermbg=0   cterm=NONE
hi LineNr       ctermfg=242 ctermbg=232 cterm=NONE
hi NonText      ctermfg=252 ctermbg=0   cterm=NONE
hi SpecialKey   ctermfg=252 ctermbg=0   cterm=NONE
hi Title        ctermfg=107 ctermbg=0   cterm=NONE
hi Visual       ctermfg=0   ctermbg=3   cterm=NONE

" Diff
hi DiffAdd      ctermfg=0   ctermbg=113 cterm=NONE
hi DiffDelete   ctermfg=0   ctermbg=52  cterm=NONE
hi DiffChange   ctermfg=0   ctermbg=4   cterm=NONE
hi DiffText     ctermfg=0   ctermbg=37  cterm=NONE
hi diffAdded    ctermfg=113 ctermbg=0   cterm=NONE
hi diffRemoved  ctermfg=1   ctermbg=0   cterm=NONE

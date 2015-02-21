set t_Co=256

set hlsearch
set number

filetype on
filetype plugin on
syntax on
colorscheme jellybeans

execute pathogen#infect()
:let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
set laststatus=2
set noshowmode

set nocompatible

set showcmd

set ignorecase
set smartcase

set expandtab
set smarttab

set shiftwidth=4
set softtabstop=4

set noswapfile

highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1

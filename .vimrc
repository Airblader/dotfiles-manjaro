

filetype on
filetype plugin indent on
filetype plugin on
syntax on
colorscheme jellybeans

execute pathogen#infect()
let g:airline_theme='airblader'
let g:airline_powerline_fonts = 1

set laststatus=2
set noshowmode

set nocompatible
set showcmd
set ignorecase
set smartcase
set expandtab
set smarttab
set hlsearch
set number
set noswapfile
set cursorline
set autoindent

set shiftwidth=4
set softtabstop=4
set scrolloff=8
set sidescrolloff=10

set timeoutlen=1000
set ttimeoutlen=0

:noremap / :set hlsearch<CR>/

" toggle paste mode
:noremap <F2> :set paste! nopaste?<CR>

" toggle number lines
:noremap <F3> :set nonumber! nonumber?<CR>

" toggle search highlights
:noremap <F4> :set hlsearch! hlsearch?<CR>

" for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
highlight Search ctermbg=1 ctermfg=255 cterm=NONE
highlight Visual ctermbg=1 ctermfg=255

function TrimWhitespace()
  %s/\s*$//
  ''
:endfunction
command! Trim call TrimWhitespace()

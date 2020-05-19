" =============================================================================
if &compatible
    set nocompatible
endif
"set runtimepath+=/home/ingo/.vim/dein.vim/repos/github.com/Shougo/dein.vim
"
"if dein#load_state('/home/ingo/.vim/dein.vim')
"    call dein#begin('/home/ingo/.vim/dein.vim')
"
"    call dein#add('/home/ingo/.vim/dein.vim/repos/github.com/Shougo/dein.vim')
"    call dein#add('Shougo/deoplete.nvim')
"    if !has('nvim')
"	call dein#add('roxma/nvim-yarp')
"	call dein#add('roxma/vim-hug-neovim-rpc')
"    endif
"
"    call dein#end()
"    call dein#save_state()
"endif
"
"let g:deoplete#enable_at_startup=1
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"
" =============================================================================

filetype on
filetype plugin indent on
filetype plugin on
syntax on

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

set completeopt-=preview

set laststatus=2
set noshowmode

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

" for cross-terminal clipboard support
set clipboard=unnamed
set clipboard^=unnamedplus

:noremap / :set hlsearch<CR>/

" toggle paste mode
:noremap <F2> :set paste! nopaste?<CR>

" toggle number lines
:noremap <F3> :set nonumber! nonumber?<CR>

" toggle search highlights
:noremap <F4> :set hlsearch! hlsearch?<CR>

" for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done
" colorscheme airblader

let g:gruvbox_contrast_dark='neutral'
colorscheme gruvbox
set background=dark

function TrimWhitespace()
  %s/\s*$//
  ''
:endfunction
command! Trim call TrimWhitespace()

" Shows the highlight group of whatever's under the cursor
 map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
 \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
 \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

set hidden
let mapleader=","
nmap <leader>n :enew<cr>
nmap <leader><leader> :bnext<CR>
nmap <leader>. :bprevious<CR>
nmap <leader>l :ls<CR>

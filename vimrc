" Let's load plugins with pathogen
call pathogen#infect()
call pathogen#helptags()

" Use Vim settings rather Vi compatibility mode
set nocompatible

" Everybody needs line numbers
set nu

" Remap the Leader
let mapleader=","

" Switch syntax highlighting on
syntax on

" Enable filetype detection and do language-dependent indenting
filetype plugin indent on

" Make backspace behave like it should
set backspace=indent,eol,start

" Show cursor position all the time
set ruler

" Remap CtrlP so it's easier to run
let g:ctrlp_map = '<c-p>'

" Always show status line
set laststatus=2

" For easier movement between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Let's change the color scheme
"syntax enable
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256


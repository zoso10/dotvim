" Let's load plugins with pathogen
call pathogen#infect()
call pathogen#helptags()

" Use Vim settings rather Vi compatibility mode
set nocompatible

" Everybody needs line numbers
set nu

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

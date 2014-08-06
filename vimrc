set shell=/bin/bash
" Let's load plugins with pathogen
call pathogen#infect()
call pathogen#helptags()

" Use Vim settings rather Vi compatibility mode
set nocompatible

" Everybody needs line numbers
set nu

" Remap the Leader
let mapleader=" "

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
syntax enable
colorscheme solarized 
set background=dark

" Fix tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Allow switching buffers that aren't saved
set hidden

" Show hidden files with CtrlP
let g:ctrlp_show_hidden=1

" Airline
let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1
set t_Co=256
set linespace=0
set encoding=utf-8

" Add cursor line
set cursorline

" Convert old Ruby hash rockets
nmap <Leader>h :s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>
vmap <Leader>h :'<,'>s/\:\([a-zA-Z_]*\)\s=>/\1\:/g<cr>

" Make Vim faster
set ttyfast
set lazyredraw

" Specify RVM path
let g:ruby_path="~/.rvm/bin/ruby"

let g:rspec_command="!bundle exec rspec {spec}"
let g:rspec_runner="os_x_iterm"

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

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

" use Solarized dark for colorscheme
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

" Rspec send to tmux
let g:rspec_command='call Send_to_Tmux("ber {spec}\n")'

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Mappings for Rake
map <Leader>r :Rake<CR>

" Make Ag and CtrlP better
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l -g ""'
endif

" Leader mappings
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>o :!open .<CR><CR>
nmap <Leader>s :sp<CR>
nmap <Leader>v :vs<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>wa :wa<CR>
nnoremap <Leader>qq :qa<CR>

" Override read-only permissions on files
cmap w!! %sudo tee > /dev/null %

" NERDTree Toggle
nmap <Leader>n :NERDTreeToggle<CR>

" Better searching
set incsearch
set hlsearch
nmap <Leader>a :noh<CR>

" Syntax highlighting for JSON files
autocmd BufNewFile,BufRead *.json set ft=javascript

" Fix indentation for <li> and <p> tags
let g:html_indent_tags = 'li\|p'

" Leader for generating ctags
map <Leader>c :!ctags -R<CR><CR>

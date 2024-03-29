set shell=/bin/zsh

" Use Vim settings rather Vi compatibility mode
set nocompatible

" Everybody needs line numbers
set relativenumber
set number

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

" use Dracula for colorscheme
syntax enable
color solarized
set background=dark
hi Normal guibg=NONE ctermbg=NONE

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
let g:airline#extensions#tabline#enabled=0
let g:airline_section_c = '%f'
let g:airline_section_y = ''
let g:airline_section_z = "%l/%L  : %c"

"set statusline=
"set statusline+=%{mode()}
"set statusline+=%{StatuslineBranch()}
"set statusline+=%#LineNr#
"set statusline+=\ %f
"set statusline+=\ %m
"
"set statusline+=%=
"
"set statusline+=\ %y
"set statusline+=\ %c
"set statusline+=\ %p
"set statusline+=%{'%'}

function! StatuslineBranch()
  let l:branchname = GitBranch()
  let l:branch_symbol = "\ue0a0"
  return strlen(l:branchname) > 0?'  '.l:branch_symbol.' '.l:branchname.' ':''
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

set t_Co=256
set linespace=0
set encoding=utf-8

" Hide vim tabline altogether
set showtabline=0

" Add cursor line
set cursorline

" Convert old Ruby hash rockets
nmap <Leader>h :s/\:\([a-zA-Z_]*\)\s\?=>/\1\:/g<cr>
vmap <Leader>h :'<,'>s/\:\([a-zA-Z_]*\)\s\?=>/\1\:/g<cr>

" Make Vim faster
set ttyfast
set lazyredraw

" Specify RVM path
let g:ruby_path="~/.rvm/bin/ruby"

" Rspec send to tmux
let g:rspec_command='call Send_to_Tmux("ber {spec}\n")'

" Test runner mappings
let test#strategy = "tslime"
let g:test#preserve_screen = 1
nmap <silent> <Leader>t :TestFile<CR>
nmap <silent> <Leader>n :TestNearest<CR>
nmap <silent> <Leader>l :TestLast<CR>

" Mappings for Rake
function! RunRubocopOnCurrentFile()
  let l:rubocop_command='call Send_to_Tmux("be rubocop {file}\n")'
  let l:file=@% " Assume current file for now
  execute substitute(l:rubocop_command, "{file}", l:file, "g")
endfunction
map <Leader>r :call RunRubocopOnCurrentFile()<CR>

" Make Ag and CtrlP better
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l -g ""'
endif

" Leader mappings
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>s :sp<CR>
nmap <Leader>v :vs<CR>
nnoremap <Leader>aq :qa<CR>

" Override read-only permissions on files
cmap w!! %sudo tee > /dev/null %

" NERDTree Toggle
nmap <Leader>o :NERDTreeToggle<CR>

" Better searching
set incsearch
set hlsearch
nmap <Leader>a :noh<CR>

" Syntax highlighting for JSON files
autocmd BufNewFile,BufRead *.json set ft=javascript

" paste magic string comment for new ruby files
autocmd BufNewFile *.rb :normal i# frozen_string_literal: true

" Fix indentation for <li> and <p> tags
let g:html_indent_tags = 'li\|p'

" Leader for generating tags with either ripper-tags or ctags
map <Leader>c :!if ripper-tags -R &> /dev/null; then; echo 'ripper-tags succeeded'; else; ctags -R --exclude=app/assets/javascripts --exclude=.git --exclude=spec/javascripts --exclude=db --exclude=tmp --exclude=vendor --exclude=node_modules; fi<CR><CR>

" Treat .rabl as .rb
au BufRead,BufNewFile *.rabl setf ruby

" Elixir specific
nmap <Leader>mt :!mix test<CR>

" Highlight column 80
set cc=80

" Inline variable
function! InlineVariable()
  normal ^*``
  normal 2w
  normal "zDdd``
  normal cwz
endfunction

map <Leader>i :call InlineVariable()<CR>

" Extract method
function! ExtractMethod() range
  let param_string = ''

  " Get all the input we need
  call inputsave()
  let method_name = input('Method name: ')
  let param_list = input('Enter params: ')
  call inputrestore()

  if param_list != ''
    let param_string = '(' . param_list . ')'
  endif

  " Restore selection and store text in reg z
  normal gv"zc
  call setline('.', method_name . param_string)
  normal ==

  " Move and add a line
  normal }
  normal o

  " Write all the text
  call setline('.', 'def ' . method_name . param_string)
  normal ==
  set paste
  normal oz
  set nopaste
  call setline('.', 'end')
  normal ==o
endfunction

map <Leader>e :call ExtractMethod()<CR>

" Set menu for filename tab completion
set wildmenu

" Leader for closing buffers
map <Leader>b :bd<CR>

let g:rust_clip_command = 'xclip -selection clipboard'

" Create method stub
function! CreateMethodStub()
  let return_string = ''

  normal ^
  let object = expand("<cword>")

  call inputsave()
  let stubbed_method = input('Method: ')
  let return_value = input('Return Value: ')
  call inputrestore()

  if return_value != ''
    let return_string = '.and_return(' . return_value . ')'
  endif

  normal o
  call setline('.', 'allow(' . object . ').to receive(:' . stubbed_method . ')' . return_string)
  normal ==
endfunction

function! CreateMethodExpectation()
  let arguments_string = ''
  call inputsave()
  let arguments_received = input('Arguments received: ')
  call inputrestore()

  if arguments_received != ''
    let arguments_string = '.with(' . arguments_received . ')'
  endif

  let method_stub_line = getline('.')
  let method_stub_line = substitute(method_stub_line, 'allow', 'expect', '')
  let method_stub_line = substitute(method_stub_line, 'receive', 'have_received', '')
  let method_stub_line = substitute(method_stub_line, '.and_return.*', '', '')

  normal o
  call setline('.', method_stub_line . arguments_string)
  normal ==
endfunction

map <Leader>ms :call CreateMethodStub()<CR>
map <Leader>me :call CreateMethodExpectation()<CR>

" Break into multiple lines
function! BreakIntoMultipleLines()
  normal ^f(a^M^[:s/, /,\r/g^M$i^M^[
endfunction

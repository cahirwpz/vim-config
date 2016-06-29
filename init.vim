" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Pathogen load
call pathogen#infect()
call pathogen#helptags()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backup              " keep a backup file
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set wildmenu            " show matches in command line
set modeline

" set UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" basic settings
set background=dark
set textwidth=80
set colorcolumn=80
set tabstop=2
set shiftwidth=2
set softtabstop=8
set expandtab
set smarttab
set number
set nowrap              " do not wrap long lines
set showmatch           " highlight matching braces

" language settings
set spelllang=pl_PL

" airline settings
set laststatus=2

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Configure vim when running in graphics mode
if has("gui_running")
  set go=afim
  set guifont=Inconsolata:h14
  set columns=120
  set lines=36
  winpos 200 64

  colorscheme wombat

  map <C-Space> <Nul>
else
  colorscheme wombat256 
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
  augroup END
else
  set autoindent        " always set autoindenting on
endif

" python-vim settings
let g:pymode_folding = 0
let g:pymode_lint_ignore = "E111,E121,C901"
let g:pymode_rope = 0

" tagbar settings
nnoremap <silent> <F8> :TagbarToggle<CR>

" java settings
au BufEnter *.pde setlocal filetype=java

" c & c++ settings
au FileType c,cpp setlocal foldmethod=syntax foldnestmax=1 cino=(0
let c_no_comment_fold = 1
let c_no_if0_fold = 1

function! GnuIndent()
  setlocal cinoptions=>4,n-2,{2,^-2,:2,=2,g0,h2,p5,t0,+2,(0,u0,w1,m1 
  setlocal shiftwidth=2 
  setlocal tabstop=8 
  setlocal noexpandtab
endfunction 

" fricas settings
au BufNewFile,BufRead *.spad,*.input setf axiom
au BufEnter *.boot setlocal filetype=axiom tabstop=8 shiftwidth=8 softtabstop=8
au BufNewFile,BufRead *.input *.spad exe "source ~/.vim/syntax/axiom.vim"

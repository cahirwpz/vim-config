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

set backup              " keep a backup file
set history=50          " keep 50 lines of command line history
set showcmd             " display incomplete commands
set modeline

" set UTF-8 encoding
set fileencoding=utf-8
set termencoding=utf-8

" airline configuration (requires powerline font to be installed)
let g:airline_powerline_fonts = 1

" basic settings
set background=dark
set textwidth=80
set colorcolumn=80
set tabstop=2
set shiftwidth=2
set softtabstop=8
set expandtab
set number
set nowrap              " do not wrap long lines
set showmatch           " highlight matching braces

" language settings
set spelllang=pl_PL

" Don't use Ex mode, use Q for formatting
map Q gq

" Configure vim when running in graphics mode
if has("gui_running")
  set go=afim
  set guifont=Inconsolata\ Medium\ 14
  set columns=120
  set lines=36
  winpos 200 64

  colorscheme mrkn256

  map <C-Space> <Nul>
else
  colorscheme mrkn256
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
endif

if has("cscope")
  " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
  set cscopetag

  " check cscope for definition of a symbol before checking ctags:
  " set to 1 if you want the reverse search order.
  set csto=0

  " add any cscope database in current directory
  if filereadable("cscope.out")
    cs add cscope.out  
  endif

  " show msg when any other cscope db added
  set cscopeverbose 

  " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
  " makes the vim window split horizontally, with search result displayed in
  " the new window.
  nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
  nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
  nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	
endif

" python-vim settings
let g:pymode_folding = 0
let g:pymode_lint_ignore = "E111,E121,C901"
let g:pymode_rope = 0

" tagbar settings
nnoremap <silent> <F8> :TagbarToggle<CR>

" Tag Highlighting settings
au BufEnter *.c,*.h silent call TagHighlight#Generation#UpdateAndRead(0)

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
au BufNewFile,BufRead *.spad,*.input set filetype=axiom
au BufEnter *.boot setlocal filetype=axiom tabstop=8 shiftwidth=8 softtabstop=8
au BufNewFile,BufRead *.input *.spad exe "source ~/.vim/syntax/axiom.vim"

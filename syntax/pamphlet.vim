"Vim syntax file
"
" Language   : Axiom pamphlet
" Maintainer : Fabio Stumbo <f.stumbo@unife.it>
" File type  : *.pamphlet (see :help filetype)
" Usage      : See the README file
"
" History
"  20131109 fabio   1.0 Creation 
"
" Comments, suggestions and remarks are welcome.
"
" The latest version of this file will always be available at
" http://www.vim.org

unlet b:current_syntax

syntax include @TeX syntax/tex.vim
syntax include @Axiom syntax/axiom.vim

syntax region axiomCode matchgroup=axChunk start="\\begin{chunk}" end="\\end{chunk}" containedin=@TeX contains=@Axiom

let b:current_syntax = 'pamphlet'

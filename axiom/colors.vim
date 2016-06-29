"Vim syntax color scheme file
"
" Maintainer : Fabio Stumbo <f.stumbo@unife.it>
"
" History
"  20131113 fabio   1.0 Creation

" Definition of colors
" IMO, these colors are nice with a black bg. If you need to change the
" bg color, just add "ctermbg=x" to every line, where x is the number
" of the color: 
" 0=black, 1=red, 2=green, 3=yellow, 4=blue, 5=magenta, 6=cyan, 7=white
" lightblack 		ctermfg=0 cterm=bold term=bold guifg=black
" lightred 		ctermfg=1 cterm=bold term=bold guifg=lightred 
" lightgreen 		ctermfg=2 cterm=bold term=bold guifg=lightgreen
" lightyellow 		ctermfg=3 cterm=bold term=bold guifg=lightyellow 
" lightblue 		ctermfg=4 cterm=bold term=bold guifg=lightblue
" lightmagenta  	ctermfg=5 cterm=bold term=bold guifg=lightmagenta 
" lightcyan 		ctermfg=6 cterm=bold term=bold guifg=lightcyan 
" lightwhite 		ctermfg=7 cterm=bold term=bold guifg=white 
" black			ctermfg=0 guifg=black
" red 			ctermfg=1 guifg=red 
" green 		ctermfg=2 guifg=green
" yellow 		ctermfg=3 guifg=yellow 
" blue 			ctermfg=4 guifg=blue
" magenta		ctermfg=5 guifg=magenta 
" cyan 			ctermfg=6 guifg=cyan 
" white 		ctermfg=7 guifg=white 
" magentainv 		ctermbg=5 ctermfg=0 guibg=magenta guifg=black
" redinv 		ctermbg=1 ctermfg=7 guibg=red guifg=white
" yellowinv 		ctermbg=3 ctermfg=7 cterm=bold term=bold guibg=yellow guifg=white

" Define the default highlighting for standar classes: modify
" this to your taste (type :highlight to see available classes).
" Alternatively, substitute this file with the file containing your
" favourite color scheme

"hi 	Comment		ctermfg=0 cterm=bold term=bold guifg=black
"hi 	Conditional	ctermfg=3 cterm=bold term=bold guifg=lightyellow
"hi 	Define		ctermfg=6 cterm=bold term=bold guifg=lightcyan
"hi 	SpecialComment	ctermfg=5 cterm=bold term=bold guifg=lightmagenta
"hi 	Error		ctermbg=1 ctermfg=7 guibg=red guifg=white
"hi 	Function	ctermfg=5 guifg=magenta
"hi 	Label		ctermfg=1 cterm=bold term=bold guifg=lightred
"hi 	Macro		ctermfg=3 guifg=yellow
"hi 	Operator	ctermfg=2 cterm=bold term=bold guifg=lightgreen
"hi 	Repeat 		ctermfg=3 cterm=bold term=bold guifg=lightyellow
"hi 	StorageClass	ctermfg=4 cterm=bold term=bold guifg=lightblue
"hi 	String		ctermfg=4 guifg=blue
"hi 	Type		ctermfg=3 guifg=yellow
"hi 	Typedef		ctermfg=7 guifg=white
"hi      Typedef         ctermfg=2 cterm=bold term=bold guifg=lightgreen

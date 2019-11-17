
" load plugins fom vundle
source ~/.vim/plugins.vim


" This part is to compile and run the code
autocmd BufNewFile,BufRead *.cpp setlocal makeprg=g++\ -o\ %:p:r\ %:p\ -std=c++11\ -W\ -Wall\ -lm
noremap <F9> :w \| make<cr><cr>:botright cwindow<cr>
"autocmd BufNewFile,BufRead *.cpp noremap <buffer> <F10> :silent vs\ %:p:r.out \|r!time  %:p:r < %:p:h/in.c<cr>


" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
"this comand is for compile in latex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf,bibtex,pdf'
"let g:Tex_MultipleCompileFormats='pdf, aux'

map <f2> :w<cr><leader>ll
map <f3> :w \| make<ENTER>

function! ToggleSyntax()
	if exists("g:syntax_on")
		syntax off
	else
		syntax enable
	endif
endfunction

nmap  ;s :call ToggleSyntax()<CR>
noremap <silent> >> :vertical resize +10<CR>
noremap <silent> << :vertical resize -10<CR>
nnoremap -ev :vsplit $MYVIMRC<cr>
nnoremap -sv :source $MYVIMRC<cr>

" This Part is to use a better color for the scheme 25/05/2017
syntax on
let g:solarized_termcolors=256
set t_Co=256 
set background=dark
" End of this new configuration

set smartindent
set tabstop=4
set shiftwidth=4
set number
set hlsearch
set noswapfile
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
map <C-O> :w \| make
set relativenumber
set splitright

" subrayar la actual linea donde estoy
set cursorline

function! CompetitionShowResult()
	let bin = expand("%:p:r")
	let inp = expand("%:p:h") . "/in.c"
	vert new
	setlocal buftype=nofile
	setlocal bufhidden=hide
	setlocal noswapfile
	execute("r !time " . bin . " < " . inp)
	normal ggdd
	"normal 
endfunction

function! CopyOfClipBoardToInC()
	let in = expand("%:p:h")."/in.c"
	execute("vs ". in)
	normal ggdG
	execute("normal \"+p")
	execute("x")
endfunction

function! CopyOutSideVim()
	normal ggvG
	execute("normal \"+y")
endfunction

autocmd FileType python nnoremap <buffer> <F9> :w !python<cr>

"It maping is only in files .cpp
autocmd BufNewFile,BufRead ~/Documents/NewTraining/*.cpp nnoremap <buffer> <F6> :call CompetitionShowResult()<CR>
autocmd BufNewFile,BufRead ~/Documents/NewTraining/*.cpp nnoremap <buffer> <F5> :call CopyOfClipBoardToInC()<CR>
autocmd BufNewFile,BufRead ~/Documents/NewTraining/*.cpp nnoremap <buffer> <F7> :call CopyOutSideVim()<CR>


"latex files: enable checker speller 
autocmd BufNewFile,BufRead *.tex set spell spelllang=en_us
"latex files: size of the row is 80
autocmd BufNewFile,BufRead *.tex set textwidth=80



" learning new staff before ending of 2019

autocmd VimResized * :wincmd =

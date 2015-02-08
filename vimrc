"vim Config by Pietro Palmesi
set nocompatible
filetype off

set rtp+=$HOME/.vim/bundle/Vundle.vim/
if has("win32")
	set rtp+=$HOME/vim/bundle/Vundle.vim/
	let path='~/vim/bundle'
	call vundle#begin(path)
else
	call vundle#begin()
endif

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'cscope.vim'
Plugin 'localrc.vim'
Plugin 'clang-complete'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'dansomething/vim-eclim'
Plugin 'Raimondi/delimitMate'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'rking/ag.vim'

"Ulti Snips START
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'



call vundle#end()

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"Ulti Snips END
filetype plugin indent on
let g:indentLine_char = 'â”Š'

"set leader
:let mapleader='\'
:let maplocalleader='_'
" no menus
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar

set nocompatible

set backspace=2 "make backespace work

set cf  " Enable error files & error jumping.
set history=256  " Number of things to remember in history.
set autowrite  " Writes on make/shell commands

"Disable pupup dialogs
"set go+=c
""Reload log files automatically
"autocmd BufNewFile,Bufread *.log set autoread
"
""Default Syntax/Filetype php
syntax enable
"
"Tab space 4
set tabstop=4
set softtabstop=4
set shiftwidth=4
"
" Auto expand tabs to spaces
set noexpandtab
"
"Display Linebreaks
set list
set listchars=tab:\·\ ,trail:¬,extends:>
"
""Display line numbers
set number
"
" Show nice info in ruler
fun! ContainsTodo()
	if search('TODO','n')
		return ' ---TODO--- '
	else
		return ''
	endif
endfu
set statusline=%f%m\ %r%h\ %{ContainsTodo()}%w%=%l-%c\ %p%%
set ruler
set laststatus=2
"
"" Use incremental searching
set incsearch
"
"" Allow file inline modelines to provide settings
set modeline
"
"" Linewidth to endless
set textwidth=0
"
"" Do not wrap lines automatically
set nowrap
"
"" Set working directory to current file
"set autochdir
"
""Set backups to central directory
set backupdir=~/tmp,/tmp,C:/_backup
set undofile
set undodir=~/tmp,/tmp,C:/_backup
"
"
"clang options
"let g:clang_snippets = 1
"let g:clang_snippets_engine = 'clang_complete'
"
"colorscheme default
"colorscheme pietro
"if has("gui_running")
"	set background=light
"else
	set background=dark
"endif
let g:solarized_visibility="low"
colorscheme solarized

imap <C-Space> <C-X><C-U>
set guifont=Droid\ Sans\ Mono\ 10
" using Source Code Pro

"spelling
set spellfile=$HOME/Dropbox/vim/spellfile.add

set completeopt=longest,menuone
"from http://caffeinatedcode.wordpress.com/2009/11/16/simple-latex-ctags-and-taglist/
let tlist_tex_settings = 'latex;l:labels;s:sections;t:subsections;u:subsubsections'

let g:tex_isk = "48-57,a-z,A-Z,192-255,:"

map <F3> :NERDTreeToggle<CR>:TlistClose<cr><F5>
:let NERDTreeChDirMode=2
:let NERDTreeIgnore=['\.ochk$', '\~$','\.o$']
"Map Taglist
map <F2> :TlistToggle<cr>:NERDTreeClose<cr><f5>

"set iskeyword=@,48-57,_,-,:,192-255

set hidden

"Map MiniBufExplorer
let g:miniBufExplAutoStart = 0
map <F4> :MBEToggle<cr>
map <A-h> :bp<cr>
imap <A-l> <esc>:bn<cr>
imap <A-h> <esc>:bp<cr>
map <A-l> :bn<cr>

"Latex Mappings
" LaTeX (rubber) macro for compiling
nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>

" View PDF macro; '%:r' is current file's root (base) name.
nnoremap <leader>v :!zathura %:r.pdf &<CR><CR>

"redraw
map <f5> :redraw!<cr>
imap <f5> :redraw!<cr>

"CC Tree
map gb "xyiw :CCTreeTraceReverse <C-R>x<CR>
map gB "xyiw :CCTreeTraceForward <C-R>x<CR>
"cscope settings
set cst
set cscopequickfix=""
function! QuickFixCscope()
	set cscopequickfix=s-,c-,d-,i-,t-,e-
	execute "cs find 0 ".expand("<cword>")
	set cscopequickfix=""
	copen
endfunction
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
map gS :call QuickFixCscope()<CR>

"fix <C-S> and <C-q>
if has("x11")
	silent !stty -ixon >/dev/null 2>/dev/null
endif

"OpenSCAD
au! BufRead,BufNewFile *.scad set filetype=openscad 

"set correct window title in tmux
"if &term == "screen"
"  set t_ts=^[k
"  set t_fs=^[\
"endif
"if &term == "screen" || &term == "xterm"
"  set title
"endif


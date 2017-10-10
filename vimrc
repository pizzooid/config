"vim Config by Pietro Palmesi
set nocompatible
filetype off
"set leader
:let mapleader='<Space>'
:let maplocalleader=','

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

"use cygwin bash
if !has("win32")
	Plug 'cscope.vim'
endif

" let Vundle manage Vundle
" required! 
Plug 'freitass/todo.txt-vim'
Plug 'gmarik/Vundle.vim'
"Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plug 'localrc.vim'
Plug 'Rip-Rip/clang_complete'
Plug 'chriskempson/base16-vim'
"Plugin 'dansomething/vim-eclim'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/argtextobj.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
"Plugin 'kien/rainbow_parentheses.vim'
Plug 'rking/ag.vim'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/Recover.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/tex_autoclose.vim'

if has('nvim')
	Plug 'cazador481/fakeclip.neovim'
endif

"Ulti Snips START
" Track the engine.
"Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plugin 'honza/vim-snippets'


call plug#end()

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"Ulti Snips END
filetype plugin indent on
let g:indentLine_char = 'â”Š'

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
""set nowrap
set wrap
set lbr
set showbreak=+++
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
let g:clang_jumpto_declaration_key="<C-}>"
"
"if has("gui_running")
"	set background=light
"else
	set background=dark
"endif
let base16colorspace="256"
colorscheme base16-default-dark

hi! link NonText ColorColumn

imap <C-Space> <C-X><C-U>
" using Source Code Pro

"spelling
set spellfile=$HOME/Dropbox/spellfile.add

set completeopt=longest,menuone
"from http://caffeinatedcode.wordpress.com/2009/11/16/simple-latex-ctags-and-taglist/
let tlist_tex_settings = 'latex;l:labels;s:sections;t:subsections;u:subsubsections'

let g:tex_isk = "48-57,a-z,A-Z,192-255,:,_"
au BufNewFile,BufRead *.tex let &isk= g:tex_isk
"set isk


"Map Tagbar
map <F2> :TagbarToggle<cr>

set hidden

"Map MiniBufExplorer
"let g:miniBufExplAutoStart = 0
"map <F4> :MBEToggle<cr>
"map <A-h> :bp<cr>
"imap <A-l> <esc>:bn<cr>
"imap <A-h> <esc>:bp<cr>
"map <A-l> :bn<cr>

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
if &term == "screen-256color"
  set t_ts=^[k
  set t_fs=^[\
endif
if &term == "screen-256color" || &term == "xterm"
  set title
endif
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler_options = '-std=c++11'

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules)$',
    \ 'file': '\v\.(exe|so|dll|o|gcda|gcno|d)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }


"Debug mappings
map <f11> :Cstep <CR>
map <f12> :Cnext <CR>
map <F8> :exe "Cprint " . expand("<cword>") <CR>
map <F9> :exe "Cbreak " . expand("%:p") . ":" . line(".")<CR>

let g:ctrlp_extensions = ['tag', 'undo', 'line']

set rnu

noremap <C-T> :CtrlPTag<CR>
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.swp,*.o

"Load Rainbow Parens
map <f4> :RainbowParenthesesToggleAll<CR>

"Clear search with <F1>
noremap <F1> :nohlsearch<CR>

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
inoremap <A-h> <Esc><C-w>h
inoremap <A-j> <Esc><C-w>j
inoremap <A-k> <Esc><C-w>k
inoremap <A-l> <Esc><C-w>l

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

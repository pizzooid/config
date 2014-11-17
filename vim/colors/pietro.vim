" Vim color file
" Maintainer: Pietro Palmesi
" Last Change:	11.07.2008

hi clear
if exists("syntax_on")
  syntax reset
endif

"Normal Text
hi Normal		gui=none		guifg=black		guibg=#ECFFF7

hi Title		gui=bold		guifg=#9a2ca4

"Status Bar
hi StatusLineNC	gui=NONE	guifg=white		guibg=#83871F
hi StatusLine	gui=none	guifg=white		guibg=#006699
hi VertSplit	gui=none	guifg=white		guibg=#83871F

"Cursor
hi Cursor	   gui=none		guifg=white	 guibg=#1C324C
hi CursorIM	 gui=none		guifg=white	 guibg=#1C324C
hi cursorline	guifg=NONE guibg=#D5F0E5   ctermbg=black

"Constant
hi Constant guifg=#c23e5f

"PreProc
hi PreProc guifg=#0072FF

"Comments
hi Comment guifg=#172168 guibg=#CCFFCC

"Search
hi Search term=reverse guibg=#FFABDE
hi Todo guibg=#FFABDE guifg=#FFFFFF

hi Type guifg=#006699 ctermfg=3

hi Error guifg=black

hi LineNr guifg=#99CCFF

hi Special guifg=#9a2ca4
hi SpecialKey guifg=#EECBC0

hi Statement guifg=#328C56
hi Identifier guifg=#006699

hi Folded term=standout guibg=#E1EFE9 guifg=#8E9693
hi Visual term=reverse cterm=reverse guibg=#DDEEDD

hi MatchParen term=NONE guifg=#993a3b guibg=#ECFFF7
hi Cursor guifg=white guibg=#1C324C
hi lCursor guifg=#ECFFF7  guifg=#1C324C

hi NpfTemplate guifg=#aba509
hi NpfFunction guifg=#936a99
hi link NpfString String

hi Function guifg=#3a506b

hi String guifg=#3fa7ff

hi Directory term=bold gui=bold ctermfg=11 guifg=black


" vim: sw=2

imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv
nmap <buffer> <F5>   <Plug>LatexChangeEnv
vmap <buffer> <F7>   <Plug>LatexWrapSelection
vmap <buffer> <S-F7> <Plug>LatexEnvWrapSelection
imap <buffer> ((     \eqref{
map <f6> :Latexmk<cr>


let g:LatexBox_ignore_warnings = ['Underfull', 'Overfull', 'specifier changed to', 'pdflatex']

set spell
set tw=100

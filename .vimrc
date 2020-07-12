syntax on
colo torte
set number
   
function! GitBranch()
	return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	let l:branchname = GitBranch()
	return strlen(l:branchname) > 0?'    '.l:branchname.' ':''
endfunction

" status bar colors
au InsertEnter * hi statusline guifg=black guibg=#d7afff ctermfg=black ctermbg=magenta
au InsertLeave * hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan
hi statusline guifg=black guibg=#8fbfdc ctermfg=black ctermbg=cyan

" Status line
" default: set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Status Line Custom
let g:currentmode={
    \ 'n'  : 'Normal',
    \ 'no' : 'NormalOperator Pending',
    \ 'v'  : 'Visual',
    \ 'V'  : 'VLine',
    \ '^V' : 'VBlock',
    \ 's'  : 'Select',
    \ 'S'  : 'SLine',
    \ '^S' : 'SBlock',
    \ 'i'  : 'Insert',
    \ 'R'  : 'Replace',
    \ 'Rv' : 'VReplace',
    \ 'c'  : 'Command',
    \ 'cv' : 'Vim Ex',
    \ 'ce' : 'Ex',
    \ 'r'  : 'Prompt',
    \ 'rm' : 'More',
    \ 'r?' : 'Confirm',
    \ '!'  : 'Shell',
    \ 't'  : 'Terminal'
    \}
set laststatus=2
set noshowmode 
set statusline=
set statusline+=%0*\ %n\ 				| " Buffer number
set statusline+=|
set statusline+=%0*\ %{StatuslineGit()}
set statusline+=%1*\ %<%F%m%r%h%w\ 			| " File path, modified, readonly, helpfile, preview
set statusline+=%3* 					| " Separator
set statusline+=%2*\ %Y\ 				| " FileType
set statusline+=%3*					| " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''} 	| " Encoding
set statusline+=\ (%{&ff}) 				| " FileFormat (dos/unix..)
set statusline+=%= 					| " Right Side 
set statusline+=%2*\ col:\ %02v\ 			| " Colomn number
set statusline+=%3* 					| " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\ 		| " Line number / total lines, percentage of document
set statusline+=%0*\%{toupper(g:currentmode[mode()])}\ 	| " The current mode

syntax on
filetype indent on
filetype plugin on
filetype plugin indent on


set autoindent
set nobackup
set nowb
set noswapfile
set showmatch
set fileencodings=utf-8,gb18030
set encoding=utf-8
set number
set ruler
set mouse=a
set noerrorbells
set nocompatible
set cindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=2
set incsearch
set hlsearch
set autoread
set autowrite
set hidden
set scs
set lbr
set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c
function! CurDir()
	let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
	return curdir
endfunction
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	else
		return ''
	endif
endfunction
set statusline+=\ \ [
set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
set statusline+=%{&fileformat}] " file format

set statusline+=%= " right align
set statusline+=0x%-8B " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P " offset

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

imap <F5> <ESC>:set ff=unix<ESC>:w<ESC>
map <F5> <ESC>:set ff=unix<ESC>:w<ESC>
imap <F9> <ESC>:let @/=''<ESC>
map <F9> <ESC>:let @/=''<ESC>
map <F12> <ESC>:tabnew<ESC>
imap <F12> <ESC>:tabnew<ESC>
nmap <Tab> <ESC>:tabnext<ESC>

autocmd BufRead * silent! %s/[\r \t]\+$//

autocmd FileType c,cpp setlocal cinoptions=:0,g0,(0,w1 shiftwidth=4 tabstop=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2 autoindent
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
autocmd FileType python syn keyword pythonDecorator True None False self

autocmd FileType python inoremap <buffer> $r return
autocmd FileType python inoremap <buffer> $i import
autocmd FileType python inoremap <buffer> $p print
autocmd FileType python inoremap <buffer> $f #--- PH----------------------------------------------<esc>FP2xi
autocmd FileType python map <buffer> <leader>1 /class
autocmd FileType python map <buffer> <leader>2 /def
autocmd FileType python map <buffer> <leader>C ?class
autocmd FileType python map <buffer> <leader>D ?def


""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
autocmd FileType javascript setl fen
autocmd FileType javascript setl nocindent

autocmd FileType javascript imap <c-t> AJS.log();<esc>hi
autocmd FileType javascript imap <c-a> alert();<esc>hi

autocmd FileType javascript inoremap <buffer> $r return
autocmd FileType javascript inoremap <buffer> $f //--- PH----------------------------------------------<esc>FP2xi

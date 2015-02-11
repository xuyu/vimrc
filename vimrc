let g:go_fmt_command = "gofmt"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
if has("lua")
	Plugin 'Shougo/neocomplete.vim'
endif
Plugin 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on

filetype on
filetype plugin on
filetype plugin indent on
syntax on

set guifont=Menlo:h13
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
set lazyredraw
set scs
set lbr
set laststatus=2

function! CurFile()
	let curfile = substitute(expand('%:p'), getcwd(), ".", "g")
	let curfile = substitute(curfile, "^\./", "", "g")
	let curfile = substitute(curfile, '/Users/xuyu', "~", "g")
	return curfile
endfunction
function! CurDir()
	let curdir = substitute(getcwd(), '/Users/xuyu', "~", "g")
	return curdir
endfunction
function! HasPaste()
	if &paste
		return 'PASTE'
	else
		return ''
	endif
endfunction
function! FileType()
	return toupper(strlen(&ft) ? &ft : 'none')
endfunction
set statusline=\ %m%{HasPaste()}\ %{CurFile()}\ \ %{CurDir()}
set statusline+=%=%-8{FileType()}\ %-6{toupper(&fileformat)}
set statusline+=\ %-16.(%l,%c\ 0x%-4B%)%<%P\ \  " offset

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufRead * silent! %s/[\r \t]\+$//
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\   exe "normal! g`\"" |
	\ endif

imap <F5> <ESC>:set ff=unix<ESC>:w<ESC>
map <F5> <ESC>:set ff=unix<ESC>:w<ESC>
imap <F9> <ESC>:let @/=''<ESC>
map <F9> <ESC>:let @/=''<ESC>
map <F12> <ESC>:tabnew<ESC>
imap <F12> <ESC>:tabnew<ESC>
nmap <Tab> <ESC>:tabnext<ESC>
nmap <F8> :TagbarToggle<CR>

colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
autocmd FileType go let g:neocomplete#enable_at_startup = 1
autocmd FileType c,cpp setlocal cinoptions=:0,g0,(0,w1 shiftwidth=4 tabstop=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2 autoindent
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Python section
let python_highlight_all = 1
autocmd FileType python syn keyword pythonDecorator True None False self
autocmd FileType python inoremap <buffer> $r return
autocmd FileType python inoremap <buffer> $i import
autocmd FileType python inoremap <buffer> $p print
autocmd FileType python map <buffer> <leader>1 /class
autocmd FileType python map <buffer> <leader>2 /def
autocmd FileType python map <buffer> <leader>C ?class
autocmd FileType python map <buffer> <leader>D ?def

" JavaScript section
autocmd FileType javascript setl fen
autocmd FileType javascript setl nocindent
autocmd FileType javascript imap <c-t> AJS.log();<esc>hi
autocmd FileType javascript imap <c-a> alert();<esc>hi
autocmd FileType javascript inoremap <buffer> $r return

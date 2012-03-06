set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent
set smarttab

" Python special case
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
filetype plugin on
filetype indent on
syntax on

set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

nnoremap ,cd :cd %:p:h<CR>
let mapleader = ","

set enc=utf-8

" Configure taglist
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

set nocompatible
set expandtab
set shiftwidth=4
set softtabstop=4
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
let Tlist_WinWidth = 50
map ,k :FufFile<cr>
map <F4> :TlistToggle<cr>
map <F8> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
set tags+=./tags
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/boost_thread

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

set nocompatible              " be iMproved, required
filetype off                  " required
set shell=bash

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/a.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'joonty/vdebug.git'
Plugin 'tpope/vim-fugitive'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'tfnico/vim-gradle'
Plugin 'nanotech/jellybeans.vim'
Plugin 'dag/vim-fish'

call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible
set expandtab
set shiftwidth=4
set softtabstop=4
set smartindent
set smarttab
set mouse=a
set background=dark
set hidden
set number
set cinoptions=:0,g0,t0,N-s
set scrolloff=15
set nostartofline
let mapleader = ","
" For tmux
set t_ut=
colorscheme jellybeans

" No swap files in working directories
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Font
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h11

" status line
set laststatus=2

" To easier work with buffers
function! DelCurrBuffer()
    let bufNr = bufnr('%')
    bprevious
    execute 'bdelete' bufNr 
endfunction
nnoremap <leader>g :buffers<CR>:buffer<Space>
nnoremap <leader>l :ls<CR>
nnoremap <leader>d :call DelCurrBuffer()<CR>
nnoremap <silent> <tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap <silent> <s-tab> :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" Navigate easier through split windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Useful text mappings
nnoremap - ddkP
nnoremap _ ddp
nnoremap <leader>( %x``x
inoremap <C-o> <esc>O

" For fast editing vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Use jk to go out of insert mode
inoremap jk <ESC>
inoremap <ESC> <NOP>

" Navigation
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
nnoremap L $
nnoremap H ^
nnoremap <UP> <NOP>
nnoremap <DOWN> <NOP>
nnoremap <LEFT> <NOP>
nnoremap <RIGHT> <NOP>

" Haskell
autocmd BufEnter *.hs compiler ghc
let g:haddock_browser="/Applications/Firefox.app/Contents/MacOS/firefox"

" Python special case
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
filetype plugin on
filetype indent on
syntax on

set shellslash
set grepprg=grep\ -nH\ $*

nnoremap ,cd :cd %:p:h<CR>

set enc=utf-8

" vim Alternative
if filereadable(".vim/a.vim")
    :so .vim/a.vim
endif

" CTRL-P
let g:ctrlp_working_path_mode = 'r'
" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" YCM
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>D :YcmDiag<CR>
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_extra_conf_vim_data = ['getcwd()']
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
" Semantic Highlight
nnoremap <leader>s :SemanticHighlight<CR>
" Clighter
let g:clighter_libclang_file = '/Applications/Xcode.app//Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:clighter_highlight_groups = ["clighterMacroInstantiation","clighterTypeRef","clighterStructDecl","clighterClassDecl","clighterEnumDecl","clighterEnumConstantDecl","clighterDeclRefExprEnum","clighterCursorDefRef","clighterFunctionDecl","clighterDeclRefExprCall","clighterMemberRefExpr","clighterNamespace"]

" Configure make to work with cmake
function! s:currentDirName()
    let l:cwd = getcwd()
    return split(l:cwd, "/")[-1]
endfunction
function! s:createNinjaCmd()
    let l:dirname = s:currentDirName()
    return "setlocal makeprg=ninja\\ -C\\ ../builddirs/" . l:dirname
endfunction
augroup cppmake
    autocmd!
    autocmd FileType cpp execute s:createNinjaCmd()
augroup END

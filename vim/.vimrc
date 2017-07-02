" variable configurations {{{

set tabstop=2     " number of spaces that a <tab> counts for
set shiftwidth=2  " number of spaces for each auto indent
set softtabstop=2 " number of spaces inserted for one <tab>
set expandtab     " use spaces instead of tabs

set foldmethod=indent " fold based on line indentation
set foldnestmax=5     " maximum fold nesting
set foldlevelstart=99 " have all folds open by default
set foldcolumn=0      " don't show the open/closed folds column

set backspace=2   " make backspaces behave 'normal'
set backspace=eol,start,indent " backspace configuration
set whichwrap+=<,>,h,l " backspace configuration
set tm=1000       " timeout for leader key
set history=500   " history size
set noswapfile    " disable swap/backup files
set nobackup
set nowb
set autoread      " reload file automatically when it was changed from outside
set number        " show line numbers
set nowrap        " don't wrap lines longer than the window
set lazyredraw    " performance improvement

set hlsearch      " highlight background when searching
set ignorecase    " case insensitive when searching
set smartcase     " case sensitive searching when upper letters

set noerrorbells  " disable error beep
set vb t_vb=      " disable error beep

set autoindent    " auto indention when line breaking
set smartindent   " auto indention based on syntax

set wildmenu      " enable better auto completion menu
set wildmode=list:longest,full

set showmatch     " highlight matching brackets

if exists('+colorcolumn')
  set colorcolumn=80
endif

augroup vimrcFold
  autocmd!
  autocmd FileType vim set foldmethod=marker
  autocmd FileType vim set foldlevel=0
augroup end

augroup i3configFold
  autocmd!
  autocmd FileType conf set foldmethod=marker
  autocmd FileType conf set foldlevel=0
augroup end
" }}}

" custom key bindings {{{
let mapleader = ','
noremap <leader>n :bp<cr>           " previous buffer
noremap <leader>m :bn<cr>           " next buffer
noremap <leader>q :bp\|bd #<cr>     " delete buffer
noremap <silent><leader>h :noh<cr>  " switch off highlighting
nmap <silent><leader>u : MundoToggle<cr>

vnoremap < <gv
vnoremap > >gv

nmap <leader>y "*y
vmap <leader>y "*y

nnoremap <silent><leader><space> :CtrlP<cr>

set hidden

noremap <silent><leader>d :NERDTreeToggle<cr>

inoremap <C-j> <Esc>

noremap <silent><leader>w <C-w>w

let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = { 'dir' : '\v[\/](.git|build)$' }
let g:ctrlp_show_hidden=1

" autocmd FileType c noremap .. ->
autocmd FileType c inoremap .. ->
autocmd FileType cpp inoremap .. ->

" }}}

" vim-plug {{{
call plug#begin('~/.vim/bundle')

Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'          " status line
Plug 'vim-airline/vim-airline-themes'   " status line themes
Plug 'scrooloose/nerdtree'              " display file tree on the side
Plug 'altercation/vim-colors-solarized' " color scheme
" Plug 'Valloric/YouCompleteMe'           " auto completion
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
Plug 'simnalamburt/vim-mundo'

call plug#end()
" }}}

" plugin configuration {{{

" vim-airline
set laststatus=2
let g:airline_theme="solarized"

" vim-colors-solarized
set background=dark
colorscheme solarized

" }}}

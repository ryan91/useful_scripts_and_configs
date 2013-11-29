autocmd! bufwritepost .vimrc source %

" Show trailing whitespace
" Must be inserted before the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" setup Pathogen to manage your plugins
call pathogen#infect()

" auto indention when line breaking
set autoindent

set pastetoggle=<F2>
set clipboard=unnamed

" rebind mapleader key
let mapleader = ","

" fix weird backspace bug
set bs=2

noremap <C-P> :update<CR>
vnoremap <C-P> <C-C>:update<CR>
inoremap <C-P> <C-O>:update<CR>

" quit vim
noremap <Leader>q :quit<CR>
noremap <Leader>Q :qa!<CR>

" for window movement
"map <c-j> <c-w>j
"map <c-k> <c-w>k
"map <c-l> <c-w>l
"map <c-j> <c-w>j

" switching between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" sort function 
" vnoremap <Leader>s :sort<CR>

" enable '</>' key for indent manipulation
vnoremap < <gv
vnoremap > >gv


" Color Scheme
set t_Co=256
color wombat256mod
" color candy

" enable syntax highlighting
" .vimrc needs to be reopened to apply changes
filetype off
filetype plugin indent on
syntax on

" showing line numbers and length
set number " show line numbers
set tw=79  " width of document
set nowrap " don't automatically wrap on load

set fo-=t  " don't automatically wrap when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" rearanges everything over the max line
vmap <Leader>f gq
nmap <Leader>f gqap

" don't know what those do
" set history=700
" set undolevels=700

" use spaces instead of tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

" make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" disable backup and swap files
" set nobackup
" set nowritebackup
set noswapfile

" ============================================================================
" Python IDE setup
" ============================================================================
" settings for vim powerline
set laststatus=2

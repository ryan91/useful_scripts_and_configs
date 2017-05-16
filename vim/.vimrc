"--------------------------------------------------------------------
" FILE NAME: .vimrc
" AUTHOR:    Yannick Runge
" PURPOSE:   Sets up a cusom vim environment
"--------------------------------------------------------------------
" KEY MAPPING:
" j             Left
" k             Down
" l             Up
" ö             Right
" CTRL+P        Write out file
" ;q            Close current file
" ;Q            Close all files
" ;e            Empty line below the current line
" ;E            Empty line above the current line
" jj            Escape (exit insert mode)
" CTRL+j        Escape (exit insert mode)
" ;F            Remove trailing whitespace
" CTRL+h        Turn off highlighting
" ;t            New tab
" ;n            Previous tab
" ;m            Next tab
" ;N            Move tab to the left
" ;M            Move tab to the right
" ;w            Move between split windows
" <             Move selection on tab to the left (visual mode)
" >             Move selection on tab to the right (visual mode)
" ;f            Rearrange everything beyond the max line width

let mapleader = ","
noremap ö l
noremap l k
noremap k j
noremap j h
noremap <C-P> :update<CR>
vnoremap <C-P> <C-C>:update<CR>
inoremap <C-P> <C-O>:update<CR>
noremap <Leader>q :quit<CR>
noremap <Leader>Q :qa!<CR>
nnoremap <silent><Leader>e :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><Leader>E :set paste<CR>m`O<Esc>``:set nopaste<CR>
inoremap jj <Esc>
inoremap <C-j> <Esc>
noremap <Leader>F :%s/\s\+$//<CR>
noremap <silent><C-h> :noh<CR>
map <Leader>t <esc>:tabnew<CR>
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>N <esc>:tabm -1<CR>
map <Leader>M <esc>:tabm +1<CR>
map <Leader>w <c-w>w
vnoremap < <gv
vnoremap > >gv
vmap <Leader>f gq
nmap <Leader>f gqap
"--------------------------------------------------------------------
" VIM ENVIRONMENT:
syntax on           " enable syntax highlighting
set autoindent      " auto indention when line breaking
set smartindent     " auto indention based on syntax
filetype indent on  " auto indention based on syntax
set number          " show line numbers
set nowrap          " don't wrap lines longer than the window
set hlsearch        " highlight background search
set ignorecase      " match all if lower case character search
set smartcase       " override 'ignorecase' if search contains upper 
                    " case characters
set noswapfile      " disable swap/backup files
set tabstop=2     " number of spaces that a <tab> counts for
set shiftwidth=2  " number of spaces for each auto indent
set softtabstop=2 " number of spaces inserted for one <tab>
set expandtab     " use spaces instead of tabs
set shiftround    " when using '<' or '>' round up to a multiple of tabs
"--------------------------------------------------------------------
" PATHOGEN AND ARILINE SETUP:
execute pathogen#infect()
let g:airline_powerline_fonts = 1
let g:syntastic_check_on_open = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="luna" 
colorscheme kalisi
set background=dark
let t_Co = 256
let g:rainbow_active = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1 
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_invoke_completion = '<S-Enter>'
" map <C-m> :YcmCompleter GoTo<CR>
" nmap <C-k> :YcmCompleter GetDoc<CR>
"--------------------------------------------------------------------


" {{{ <<< Variable configuration >>>
" {{{ Leader key
let mapleader = ','
" }}}
" {{{ Timeout
set tm=1000
" }}}
" {{{ Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" }}}
" {{{ Folding
set foldmethod=marker
set foldlevel=0
set foldnestmax=5
set foldlevelstart=0
set foldcolumn=0
" }}}
" {{{ Background
set background=dark
" }}}
" {{{ Searching
set hlsearch
set ignorecase
set smartcase
" }}}
" {{{ Buffers
set hidden
noremap <silent><leader>q :bp\|bd #<cr>
noremap <silent><leader>q :bp\|bd! #<cr>
nnoremap <silent><leader><leader> :b#<cr>
" }}}
" {{{ Highlighting
noremap <silent><leader>h :noh<cr>
" }}}
" {{{ Intentation
vnoremap < <gv
vnoremap > >gv
set autoindent
set smartindent
" }}}
" {{{ Display line number on the side
set number
" }}}
" {{{ Auto completion
set wildmenu
set wildmode=list:longest,full
" }}}
" {{{ Moving between window splits
noremap <silent><M-h> :wincmd h<cr>
noremap <silent><M-j> :wincmd j<cr>
noremap <silent><M-k> :wincmd k<cr>
noremap <silent><M-l> :wincmd l<cr>
" }}}
" {{{ Remove trailing whitespace
noremap <silent><leader>F :%s/\s\+$//<cr>:noh<cr>
" }}}
" {{{ Switch between C/C++ header and source file
function! SwitchHeaderSource()
  let ext = expand("%:e")
  let filename = expand("%:t:r")

  if ext ==? "cc" || ext ==? "c" || ext ==? "cpp"
    let cmd = "find . -name " . filename . ".h" . " -or -name " . filename . ".hh -or -name " . filename . ".hpp"
  elseif ext ==? "hh" || ext ==? "h" || ext ==? "hpp"
    let cmd = "find . -name " . filename . ".c" . " -or -name " . filename . ".cc -or -name " . filename . ".cpp"
  else
    echo "Not a C/C++ file"
    return
  endif

  let openfile = systemlist(cmd)

  if len(openfile) == 0
    echo "Did not find a corresponding file"
    return
  endif

  execute 'edit' openfile[0]
endfunction
map <leader>s :call SwitchHeaderSource()<cr>
" }}}
" {{{ Insert Doxygen header
function! InsertDoxygenHeader()
  goto 1
  execute "normal O\<esc>^d$"
  execute "normal i/*!\<cr>\\file   \<esc>"
  put = expand('%:t')
  execute "normal i\<bs>\<esc>A\<cr>\\author Yannick Boekle\<cr>\\brief  ...\<cr>/"
endfunction
" }}}
" }}}
" {{{ <<< Plugins >>>
" {{{ Plugin manager installation (vim-plug)
if !filereadable(expand('$HOME/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" }}}
" {{{ Plugin installation
call plug#begin('~/.config/nvim/plugged/')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/ghcmod-vim', { 'for' : 'haskell' }
Plug 'hzchirs/vim-material'
Plug 'morhetz/gruvbox'
Plug 'nbouscal/vim-stylish-haskell', { 'for' : 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for' : 'haskell' }
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/vimproc.vim' " dependency of ghcmod
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'spf13/vim-autoclose'
call plug#end()
" }}}
" {{{ Plugin configuration
" {{{ gruvbox
if filereadable(expand('$HOME/.config/nvim/plugged/gruvbox/colors/gruvbox.vim'))
  colorscheme gruvbox
  let g:airline_theme='gruvbox'
endif
" }}}
" {{{ CtrlP
if filereadable(expand('$HOME/.config/nvim/plugged/ctrlp.vim/plugin/ctrlp.vim'))
nnoremap <silent><leader><space> :CtrlPBuffer<cr>
nnoremap <silent><leader>p :CtrlP<cr>
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = { 'dir' : '\v[\/](.git|build)$' }
let g:ctrlp_show_hidden=1
endif
" }}}
" {{{ NERDTree
if filereadable(expand('$HOME/.config/nvim/plugged/nerdtree/plugin/NERD_tree.vim'))
noremap <silent><leader>d :NERDTreeToggle<cr>
endif
" }}}
" {{{ ghc-mod
noremap <leader>hc :GhcModCheck<cr>
noremap <leader>hl :GhcModLint<cr>
noremap <leader>ht :GhcModType<cr>
" }}}
" {{{ stylish-haskell
noremap <leader>hf :call StylishHaskell()<cr>
" }}}
" }}}
" }}}

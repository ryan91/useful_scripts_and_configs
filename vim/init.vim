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
" {{{ Function for switching tab widths
function! SetTabWidth(width)
  execute "set tabstop=" . a:width
  execute "set shiftwidth=" . a:width
  execute "set softtabstop=" . a:width
endfunction
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
" {{{ Ctrl+s for saving
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>
" }}}
" {{{ German Umlaute in LaTeX
inoremap <C-;> \"o
inoremap <C-'> \"a
inoremap <C-]> \"u
" }}}
" {{{ Edit Neovim configuration (init.vim)
nnoremap <leader>] :e $MYVIMRC<cr>
" }}}
" {{{ Buffers
set hidden
noremap <silent><leader>q :bp\|bd #<cr>
noremap <silent><leader>Q :bp\|bd! #<cr>
nnoremap <silent><leader><leader> :b#<cr>
" }}}
" {{{ Highlighting
noremap <silent><leader>hh :noh<cr>
" }}}
" {{{ Color column
if exists('+colorcolumn')
  set colorcolumn=80
endif
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
" {{{ Moving between tabs
nnoremap <leader>m :tabnext<cr>
nnoremap <leader>n :tabprevious<cr>
" }}}
" {{{ Remove trailing whitespace
noremap <silent><leader>F :%s/\s\+$//<cr>:noh<cr>
" }}}
" {{{ Switch between C/C++ header and source file
function! FindFileAndEdit(filename, dir, ext, switchwins)
  let l:file = findfile(a:filename . "." . a:ext, a:dir)
  if len(l:file) > 0
    if (a:switchwins)
      execute 'wincmd l'
    endif
    execute 'edit' l:file
    return 1
  endif
  return 0
endfunction

function! SwitchHeaderSource(sw)
  let l:name = expand("%:t:r")
  let l:dir = expand("%:p:h")
  let l:ext = expand("%:e")

  if index(["c","cpp","cc","h","hpp","hh"], l:ext) == -1
    echo "Not a C/C++ file"
  endif

  if l:ext ==? "cpp" && (FindFileAndEdit(l:name, l:dir, "hpp", a:sw) ||
        \ FindFileAndEdit(l:name, l:dir, "h", a:sw))
    return
  endif

  if l:ext ==? "c" && FindFileAndEdit(l:name, l:dir, "h", a:sw)
    return
  endif

  if l:ext ==? "h" && (FindFileAndEdit(l:name, l:dir, "c", a:sw) ||
        \ FindFileAndEdit(l:name, l:dir, "cpp", a:sw))
    return
  endif

  if l:ext ==? "hh" && FindFileAndEdit(l:name, l:dir, "cc", a:sw)
    return
  endif

  if l:ext ==? "cc" && FindFileAndEdit(l:name, l:dir, "hh", a:sw)
    return
  endif

  if l:ext ==? "hpp" && FindFileAndEdit(l:name, l:dir, "cpp", a:sw)
    return
  endif

  echo "Did not find corresponding C/C++ file"
endfunction
map <silent><leader>s :call SwitchHeaderSource(0)<cr>
map <silent><leader>S :call SwitchHeaderSource(1)<cr>
" }}}
" {{{ Rename variable in function
nnoremap <leader>rr [{v%::s/<C-R>///gc<left><left><left>
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
" {{{ Don't allow editing of read-only files
autocmd BufRead * call ReadOnlyNoEdit()
function! ReadOnlyNoEdit()
  if &readonly == 1
    set nomodifiable
  else
    set modifiable
  endif
endfunction
" }}}
" {{{ Align Function arguments underneath each other
set cino+=(0
" }}}
" }}}
" {{{ <<< Plugin installation >>>
call plug#begin('~/.config/nvim/plugged/')
Plug 'MattesGroeger/vim-bookmarks'                            " Set bookmarks in documents
Plug 'Valloric/YouCompleteMe'                                 " Auto completion
Plug 'ctrlpvim/ctrlp.vim'                                     " Search files with CTRL+P
Plug 'expipiplus1/vim-stylish-haskell', { 'for' : 'haskell' } " this is a fork (somehow better than the original, forgot how)
Plug 'mhinz/vim-grepper'                                      " Interfance to grep for terms
Plug 'morhetz/gruvbox'                                        " Color scheme
Plug 'parsonsmatt/intero-neovim', { 'for' : 'haskell' }       " Haskell GHCI interface
Plug 'rhysd/vim-llvm'                                         " Syntax highlighting for .td file (and more)
Plug 'sakhnik/nvim-gdb'                                       " GDB interface
Plug 'scrooloose/nerdtree'                                    " Directory tree on demand
Plug 'vim-airline/vim-airline'                                " Status bar etc.
Plug 'vim-airline/vim-airline-themes'                         " Themes for status bar
Plug 'vim-scripts/haskell.vim', { 'for' : 'haskell' }         " Haskell highlighting
call plug#end()
" }}}
" {{{ <<< Plugin configuration >>>
" {{{ gruvbox and airline
if filereadable(expand('$HOME/.config/nvim/plugged/gruvbox/colors/gruvbox.vim'))
  colorscheme gruvbox
  let g:airline_theme='gruvbox'
  let g:airline_powerline_fonts=1
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.linenr='Ξ'
  let g:airline_symbols.whitespace = '✗'
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
" {{{ stylish-haskell
if filereadable(expand('$HOME/.config/nvim/plugged/vim-stylish-haskell/ftplugin/haskell/stylish-haskell.vim'))
  noremap <leader>hf :call StylishHaskell()<cr>
endif
" }}}
" {{{ Intero
augroup interoMaps
  au!
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<cr>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<cr>
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<cr>
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<cr>
  au FileType haskell nnoremap <silent> <leader>ir :InteroReload<cr>
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentFile<cr>
  au FileType haskell nnoremap <silent> <leader>iT <Plug>InteroGenericType
  au FileType haskell nnoremap <silent> <leader>it <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>ii :InteroTypeInsert<cr>
  au FileType haskell nnoremap <silent> <leader>id :InteroGoToDef<cr>
augroup end
let g:intero_start_immediately = 0
let g:intero_type_on_hover = 0
let g:intero_window_size = 17
" }}}
" {{{ YouCompleteMe
nnoremap <leader>gd :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>gi :YcmCompleter GoToInclude<cr>
nnoremap <leader>gg :YcmCompleter GoTo<cr>
nnoremap <leader>gt :YcmCompleter GetType<cr>
nnoremap <leader>gf :YcmCompleter FixIt<cr>
" }}}
" {{{ nvim-gdb
let g:nvimgdb_disable_start_keymaps = 1
map <leader>gdb :GdbStart gdb -q /a.out
" }}}
" }}}

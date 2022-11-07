" ========= Register Plugins ====================================< start >=====
call plug#begin('~/.local/share/nvim/plugged')
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'bfrg/vim-cpp-modern'
Plug 'gabesoft/vim-ags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
call plug#end()
" ========= Register Plugins ====================================<  end  >=====

" ========= General configuration ===============================< start >=====
set background=dark
set tabstop=2
set softtabstop=-1
set shiftwidth=0
set expandtab
set hidden
set smartcase
set number

let mapleader = ','
let maplocalleader = ','

vno < <gv
vno > >gv

nn <silent><leader>] :e $MYVIMRC<cr>
nn <silent><M-h> :wincmd h<cr>
nn <silent><M-j> :wincmd j<cr>
nn <silent><M-k> :wincmd k<cr>
nn <silent><M-l> :wincmd l<cr>
nn <silent><leader>n :tabp<cr>
nn <silent><leader>m :tabn<cr>
nn <silent><leader>N :tabm -1<cr>
nn <silent><leader>M :tabm +1<cr>
nn <silent><leader>q :bp\|bd #<cr>
nn <silent><leader>Q :bp\|bd! #<cr>
nn <silent><leader>w :write<cr>
nn <silent><leader>t :tabnew<cr>

autocmd BufWritePre * :%s/\s\+$//e
autocmd FileType c,cpp :set cino+=(0

if exists(g:neovide)
  set guifont=FiraCode\ Nerd\ Font\ Mono:h20
else
endif
" ========= General configuration ===============================<  end  >=====



" ========= Plugin Configutation ================================< start >=====
if has_key(g:plugs, 'awesome-vim-colorschemes')
  colorscheme molokai
endif
if has_key(g:plugs, 'vim-ags')
  nn <leader>a :Ags<space>
endif
if has_key(g:plugs, 'vim-gitgutter')
  highlight GitGutterAdd ctermfg=1
  highlight! link GitGutterAdd LineNr
  highlight GitGutterChange ctermfg=1
  highlight! link GitGutterChange LineNr
  highlight GitGutterDelete ctermfg=1
  highlight! link GitGutterDelete LineNr
  " let g:gitgutter_sign_added = '⊕'
  " let g:gitgutter_sign_modified = '⊘'
  " let g:gitgutter_sign_removed = '⊖'
  " let g:gitgutter_sign_removed_modified = '⊛'
endif
if has_key(g:plugs, 'vim-airline')
  if has_key(g:plugs, 'awesome-vim-colorschemes')
    let g:airline_theme = 'angr'
  endif
  let g:airline_symbols = {}
  " let g:airline_symbols.linenr = ''
  " let g:airline_symbols.maxlinenr = '¶ '
  " let g:airline_symbols.whitespace= '✗'
  " let g:airline_symbols.whitespace= 'Ξ'
  let g:airline_symbols.readonly = ' '
  " let g:airline_symbols.colnr = '┋'
endif
if has_key(g:plugs, 'ctrlp.vim')
  let g:ctrlp_working_path_mode = 'a'
  nn <silent><leader><space> :CtrlPBuffer<cr>
endif
if has_key(g:plugs, 'coc.nvim')
  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction
  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
  command! -nargs=0 Format :call CocAction('format')
  nn <leader>s :CocCommand clangd.switchSourceHeader<cr>
  nn cf <Plug>(coc-fix-current)
  nn <silent> cd <Plug>(coc-definition)
  nn <silent> ci <Plug>(coc-implementation)
  nn <silent> cn <Plug>(coc-diagnostic-next)
  nn <silent> cp <Plug>(coc-diagnostic-prev)
  nn cr <Plug>(coc-rename)
  nn <leader>d <Cmd>CocCommand explorer<cr>
  nn <silent> ct :call ShowDocumentation()<cr>
  xmap <leader>v <Plug>(coc-codeaction-selected)
  inoremap <silent><expr> <tab> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
  if has_key(g:plugs, 'vim-airline')
    " let g:airline#extensions#coc#enabled = 1
    let g:airline#extensions#coc#error_symbol = '⚡'
    " let g:airline#extensions#coc#warning_symbol = '‼'
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
  endif
  set signcolumn=number
endif
" ========= Plugin Configuration ================================<  end  >=====

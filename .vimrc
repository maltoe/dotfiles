execute pathogen#infect()

set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set rnu
set nu
set autoindent
set background=dark
set mouse=a
set backupdir=~/.vim/tmp//
set incsearch
set ignorecase
set smartcase
set hlsearch

" Keys.
nmap j gj
nmap k gk
imap jj <Esc>
nmap // :nohlsearch<CR>
let mapleader = ","

" 256 colors colorscheme.
colorscheme distinguished

" Syntax highlighting.
filetype plugin indent on
syntax on

" Easy-motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1  " Case insensitivity
nmap s <Plug>(easymotion-s)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" NERDtree ignores, close on last window.
let NERDTreeIgnore=['\.o$', '\~$', '\.lo$', '\.la$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Reset terminal to smaller font-size.
autocmd VimEnter * silent ! vimfont.sh
autocmd VimLeave * silent ! vimfont.sh reset

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Tagbar
nmap <F8> :TagbarToggle<CR>

" ctrlp with ag
let g:ctrlp_show_hidden = 1
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

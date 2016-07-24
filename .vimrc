" Plugins managed with vim-plug
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'Lokaltog/vim-distinguished'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'bronson/vim-trailing-whitespace'
call plug#end()

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
let mapleader = ","
nmap j gj
nmap k gk
imap jj <Esc>
nmap // :nohlsearch<CR>
nmap <C-b> :b#<CR>
nmap <C-n> :bprev<CR>
nmap <C-m> :bnext<CR>
nmap <C-s> :w<CR>
nmap <Nul> :CtrlPBuffer<CR>

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
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 0
" let g:ctrlp_switch_buffer = 0
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

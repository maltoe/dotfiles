execute pathogen#infect()

set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set rnu
set autoindent
set background=dark
set mouse=a

" Keys.
:imap jj <Esc>
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

" NERDtree autoload, etc.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeIgnore=['\.o$', '\~$', '\.lo$', '\.la$']

" Reset terminal to smaller font-size.
autocmd VimEnter * silent ! vimfont.sh
autocmd VimLeave * silent ! vimfont.sh reset

" neocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" neosnippets
let g:neosnippet#snippets_directory='~/.vim/snippets'
let g:neosnippet#enable_snipmate_compatibility=1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" Tagbar
nmap <F8> :TagbarToggle<CR>

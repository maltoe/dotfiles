set tabstop=2
set shiftwidth=2
set expandtab
set number
set autoindent
set background=dark
set mouse=a

highlight NonText ctermfg=DarkGrey
highlight SpecialKey ctermfg=DarkGrey
highlight LineNr ctermfg=DarkGrey

:imap jj <Esc>

filetype plugin indent on
syntax on

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

autocmd VimEnter * silent ! vimfont.sh
autocmd VimLeave * silent ! vimfont.sh reset



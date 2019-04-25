set bg=dark

set shiftwidth=4
set softtabstop=4
set expandtab
syntax on
filetype plugin indent on


set paste

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

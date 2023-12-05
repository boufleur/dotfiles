set nocompatible              " be iMproved, required
filetype off                  " required

" change leader to ,
let mapleader = ","

" style
set bg=dark
set ruler
set number

" indentation
set shiftwidth=4
set tabstop=4
set expandtab

syntax on
filetype plugin indent on

" settings for yaml
au! BufNewFile,BufReadPost *.{yaml,yml,eyaml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml nnoremap <buffer> <localleader>c I#<esc>

" reveal special chars
set list
set listchars=eol:·,tab:▸·

" blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" mouse support
set mouse=a
set clipboard=unnamed " copy stuff straight to clipboard

" refresh files if changed
set autoread
au CursorHold,CursorHoldI * checktime

" save undo, backups and swap to tmp
set backupdir=$TMPDIR//
set directory=$TMPDIR//
set undodir=$TMPDIR//

" vim plug
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
"
" For new installations, run the following command
" ```shell
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ```

Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'zivyangll/git-blame.vim'
Plug 'rodjek/vim-puppet'
Plug 'pearofducks/ansible-vim'
Plug 'tarekbecker/vim-yaml-formatter'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'gosukiwi/vim-atom-dark'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" hide the tilde for empty lines
set fillchars=eob:\ 


" show nerdtree
nmap <leader>ne :NERDTree<cr>

" fzf shortcuts
noremap <leader>f <esc><esc>:Files<cr>
noremap <leader>r <esc><esc>:Rg<cr>

" set colorscheme
colorscheme atom-dark-256

" enable statusline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
set laststatus=2
set noshowmode
let g:lightline = {
          \ 'colorscheme': 'Tomorrow_Night',
                \ }

" edit / source mapping
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" custom remapings
nnoremap <leader>u viwUe
inoremap jj <esc>
inoremap <esc> <nop>


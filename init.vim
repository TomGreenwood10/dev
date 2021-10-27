syntax on

" General settings ----------------------------------
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set splitright
set background=dark
set colorcolumn=80

highlight ColorColumn ctermbg=0 guibg=lightgrey
" ===================================================

" Plugins -------------------------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'

call plug#end()
" ===================================================

" Key remaps ----------------------------------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" ===================================================

" Misc ----------------------------------------------
colorscheme gruvbox
" ===================================================

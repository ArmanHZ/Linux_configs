"
" \ \   / (_)_ __ ___  _ __ ___ 
"  \ \ / /| | '_ ` _ \| '__/ __|
"   \ V / | | | | | | | | | (__ 
"    \_/  |_|_| |_| |_|_|  \___|
"

call plug#begin('~/.config/nvim/Nvim_plugins/')
	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdtree'
	Plug 'ycm-core/YouCompleteMe'
    Plug 'morhetz/gruvbox'
"   Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let &shell='/bin/zsh -i'

" set termguicolors     " Might cause color problems with some distros, if so comment out.

set number relativenumber
set wildmode=longest,list,full
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set splitbelow splitright
set laststatus=2

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

syntax on
set t_Co=256

let g:gruvbox_contrast_dark="hard"
colorscheme gruvbox
set background=dark

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
set noshowmode

hi Normal guibg=NONE ctermbg=NONE

" Easier split movement.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Shift+Vim keys to resize splits.
nnoremap <S-J>  :res-2<CR>
nnoremap <S-H>  :vertical res+2<CR>
nnoremap <S-L>  :vertical res-2<CR>
nnoremap <S-K>  :res+2<CR>

" Ctrl+n to open NERDTree.
nnoremap <C-N>      :NERDTree<CR>

" Ctrl+y to copy to clipboard.
noremap <C-Y> "+y


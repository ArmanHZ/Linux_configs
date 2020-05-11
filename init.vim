"
" \ \   / (_)_ __ ___  _ __ ___ 
"  \ \ / /| | '_ ` _ \| '__/ __|
"   \ V / | | | | | | | | | (__ 
"    \_/  |_|_| |_| |_|_|  \___|
"

call plug#begin('~/.config/nvim/Nvim_plugins/')
	Plug 'itchyny/lightline.vim'
	Plug 'preservim/nerdtree'
	Plug 'wadackel/vim-dogrun'
	Plug 'artanikin/vim-synthwave84'
	Plug 'danilo-augusto/vim-afterglow'
	Plug 'rakr/vim-one'
	Plug 'ycm-core/YouCompleteMe'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'joshdick/onedark.vim'
    Plug 'morhetz/gruvbox'
call plug#end()

set termguicolors

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


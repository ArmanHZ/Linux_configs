"
" \ \   / (_)_ __ ___  _ __ ___ 
"  \ \ / /| | '_ ` _ \| '__/ __|
"   \ V / | | | | | | | | | (__ 
"    \_/  |_|_| |_| |_|_|  \___|
"

call plug#begin('~/.config/nvim/nvim_plugins/')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'ycm-core/YouCompleteMe'
    Plug 'morhetz/gruvbox'
"    Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
set mouse=a
set t_Co=256

let g:gruvbox_contrast_dark='hard'

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'

colorscheme gruvbox
set background=dark

set noshowmode

hi Normal guibg=NONE ctermbg=NONE

" Ctrl+n to open NERDTree.
nnoremap <C-N>      :NERDTree<CR>

set clipboard+=unnamedplus

" source $HOME/.config/nvim/coc_config.vim


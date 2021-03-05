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
    Plug 'dracula/vim', {'as': 'dracula'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

let &shell='/bin/zsh -i'

" set termguicolors     " Might cause color problems with some distros, if so comment out.

set number relativenumber
set wildmode=longest,list,full
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set splitbelow splitright
set laststatus=2
set guicursor=

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Scroll distance
set scrolloff=3

syntax on
set mouse=a
set t_Co=256


" let g:gruvbox_contrast_dark='hard'

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='base16'

set background=dark
colorscheme dracula

set noshowmode

hi Normal guibg=NONE ctermbg=NONE

" Ctrl+n to open NERDTree.
nnoremap <C-N>      :NERDTree<CR>

set clipboard+=unnamedplus

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
}
EOF

" source $HOME/.config/nvim/coc_config.vim


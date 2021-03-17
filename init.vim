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
    Plug 'nvim-lua/completion-nvim'
    Plug 'morhetz/gruvbox'
    " Plug 'dracula/vim', {'as': 'dracula'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'neovim/nvim-lspconfig'
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
set scrolloff=4

syntax on
set mouse=a
set t_Co=256

let NERDTreeQuitOnOpen=1

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_max_num_candidates = 15

let g:gruvbox_contrast_dark='hard'

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='base16'

set background=dark
colorscheme gruvbox

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

lua << EOF
    require'lspconfig'.pyright.setup{}
    require'lspconfig'.tsserver.setup{}
    require'lspconfig'.clangd.setup{}
    require'lspconfig'.groovyls.setup{}
    require'lspconfig'.jsonls.setup{}
EOF

autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c


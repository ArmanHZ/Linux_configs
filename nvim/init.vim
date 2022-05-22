"
" \ \   / (_)_ __ ___  _ __ ___ 
"  \ \ / /| | '_ ` _ \| '__/ __|
"   \ V / | | | | | | | | | (__ 
"    \_/  |_|_| |_| |_|_|  \___|
"

call plug#begin('~/.config/nvim/nvim_plugins/')
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'dracula/vim', {'as': 'dracula'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
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
set scrolloff=7

syntax on
set mouse=a
set t_Co=256

let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1

set background=dark
let g:dracula_colorterm = 1
let g:dracula_italic = 0
colorscheme dracula

set noshowmode

" hi Normal guibg=NONE ctermbg=NONE

" Ctrl+n to open NERDTree.
nnoremap <C-N> <cmd>CHADopen<CR>

" Control key to Ctrl+w (will mess with tmux).
" nnoremap <C-b> <C-w>

" Buffer movement keys.
nnoremap <F2> <cmd>bp<cr>
nnoremap <F3> <cmd>bn<cr>
nnoremap <F4> <cmd>buffers<cr>

" Delete is moved to null buffer. Use 'x' to cut.
nnoremap d "_d

" Copy to system clipboard
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

" Will require seperate installations. Check the LSP github page.
lua << EOF
    require'lspconfig'.pyright.setup{}
    require'lspconfig'.tsserver.setup{}
    require'lspconfig'.clangd.setup{}
    require'lspconfig'.groovyls.setup{}
    require'lspconfig'.jsonls.setup{}
    require'lspconfig'.phpactor.setup{}
    require'lspconfig'.bashls.setup{}
    
    vim.g.coq_settings = {
        auto_start = 'shut-up',
    }
EOF


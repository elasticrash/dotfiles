set nocompatible            " disable compatibility to old-time vi
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
syntax enable               " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on          " enable filetype plugins
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set whichwrap+=<,>,[,]	    " move to next line with theses keys
set noswapfile	            " disable swapfile
set conceallevel=0          " so that quotes are not hidden
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'j-hui/fidget.nvim', { 'tag': 'legacy' } " LSP progress
Plug 'neovim/nvim-lspconfig'		" required for rust-tools
Plug 'hrsh7th/nvim-cmp'				" Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp' 		" LSP completion
Plug 'hrsh7th/vim-vsnip'			" Snippet completion
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.1.0'}
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'		" required for telescope, rust-tools, etc
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'lourenci/github-colors', {'do': ':TSUpdate'}
Plug 'rmagatti/auto-session', {'tag': 'v2.0.1'}
Plug 'preservim/tagbar'
Plug 'github/copilot.vim'
Plug 'simrat39/rust-tools.nvim'
Plug 'williamboman/mason.nvim' , { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim' " brings mason lsp to nvim-lspconfig
Plug 'kosayoda/nvim-lightbulb'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'Yggdroot/indentLine'
Plug 'APZelos/blamer.nvim'
call plug#end()

" colorscheme
" ---------------------------
set termguicolors
set background=dark
colorscheme github-colors

" load lua plugins 
" ---------------------------
lua require('plugins');

" keyboard mappings
" ---------------------------
map <C-t> :Telescope file_browser <CR>
map <C-f> :Telescope grep_string <CR>
map <C-g> :Telescope resume <CR>
map <F10> :Tagbar <CR>
map <C-s> :wa <CR>

" move lines up and down with alt + j/k
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" other
" --------------------------
let g:jsdoc_lehre_path='/usr/lib/node_modules/lehre/bin/lehre'
let g:indentLine_conceallevel = 0

" auto format with LSP
" --------------------------
autocmd BufWritePre * lua vim.lsp.buf.format()



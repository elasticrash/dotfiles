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
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set whichwrap+=<,>,[,]
set noswapfile
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
Plug 'williamboman/mason.nvim'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.1.0'}
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'Djancyp/better-comments.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
Plug 'lourenci/github-colors', {'do': ':TSUpdate'}
Plug 'rmagatti/auto-session'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/tagbar'
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

 " other
 " --------------------------
let g:jsdoc_lehre_path = '/usr/lib/node_modules/lehre/bin/lehre'
 
 " Coc
 " --------------------------
 :hi CocInlayHint guibg=Yellow guifg=Black ctermbg=Yellow ctermfg=Black


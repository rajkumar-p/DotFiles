set number
set relativenumber

set cursorline

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

set noswapfile

" Turn of highlighting during search
" To toggle: set hlsearch!
set nohlsearch

hi Pmenu ctermbg=lightgreen
hi SignColumn ctermbg=white

" Add support for using Backspace in insert mode
set backspace=indent,eol,start  " more powerful backspacing

" Using plug.vim to manage other plugins
" [https://github.com/junegunn/vim-plug]
" Plugins will be installed at ~/.local/share/nvim/plugged
call plug#begin(stdpath('data') . '/plugged')

" [https://github.com/hoob3rt/lualine.nvim]
Plug 'hoob3rt/lualine.nvim'

" First install [https://github.com/ryanoasis/nerd-fonts]
" [https://github.com/kyazdani42/nvim-web-devicons]
Plug 'kyazdani42/nvim-web-devicons'

" [https://github.com/nvim-telescope/telescope.nvim]
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" [https://github.com/neovim/nvim-lspconfig]
Plug 'neovim/nvim-lspconfig'

" [https://github.com/glepnir/lspsaga.nvim]
Plug 'glepnir/lspsaga.nvim'

" [https://github.com/nvim-treesitter/nvim-treesitter]
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" [https://github.com/nvim-lua/completion-nvim]
Plug 'nvim-lua/completion-nvim'

" [https://github.com/tpope/vim-surround]
Plug 'tpope/vim-surround'

" [https://github.com/tpope/vim-commentary]
Plug 'tpope/vim-commentary'

" [https://github.com/tpope/vim-sleuth]
Plug 'tpope/vim-sleuth'

" catppuccin theme [https://github.com/catppuccin/nvim]
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

" Set color scheme to catppuccin
colorscheme catppuccin-latte " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

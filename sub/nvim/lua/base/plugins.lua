vim.cmd([[packadd packer.nvim]])


return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' }
    }

    use 'ellisonleao/gruvbox.nvim'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'google/vim-searchindex'
    use 'tpope/vim-commentary'
    use 'ap/vim-css-color'
    use 'preservim/tagbar'
    use 'preservim/vimux'
    use 'rbgrouleff/bclose.vim'
    use 'frazrepo/vim-rainbow'
    use 'mattn/emmet-vim'
    use 'Pocco81/auto-save.nvim'
    use 'windwp/nvim-autopairs'
    use 'lewis6991/gitsigns.nvim'
    use 'windwp/nvim-ts-autotag'
    use 'lervag/vimtex'
    use {
        'shime/vim-livedown',  -- Markdown previewer :LivedownPreview
        run = '/usr/bin/npm install -g livedown'
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use { 'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    use { 'folke/trouble.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use {
        'williamboman/mason.nvim',
        requires = {
            "williamboman/mason-lspconfig.nvim"
        },
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', opt = false }
        }
    }
end)

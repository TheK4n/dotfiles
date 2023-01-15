return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'ellisonleao/gruvbox.nvim'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'ap/vim-css-color'
    use 'preservim/tagbar'
    use 'preservim/vimux'
    use 'rbgrouleff/bclose.vim'
    use 'frazrepo/vim-rainbow'

    -- requiered patch your font
    use 'ryanoasis/vim-devicons'
    use 'powerman/vim-plugin-ruscmd'  -- Russian navigation

    use 'Pocco81/auto-save.nvim'
    use 'windwp/nvim-autopairs'

    -- pyright
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'nvim-lua/plenary.nvim'

    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', opt = false }
    }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use 'lewis6991/gitsigns.nvim'
    use 'windwp/nvim-ts-autotag'

end)

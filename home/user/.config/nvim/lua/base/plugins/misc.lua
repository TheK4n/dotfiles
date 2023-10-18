return {
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'google/vim-searchindex',
    'rbgrouleff/bclose.vim',
    'Pocco81/auto-save.nvim',  -- autosave files
    'windwp/nvim-autopairs',  -- auto pair brackets and tags
    'lewis6991/gitsigns.nvim',  -- git integration
    'windwp/nvim-ts-autotag',
    'chaoren/vim-wordmotion',
    'numToStr/Comment.nvim',
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    },
    {
        'preservim/tagbar',
        keys = {
            { '<Leader>t', '<cmd>TagbarToggle<CR>' }
        },
        enabled = vim.fn.executable "ctags" == 1
    },
    {
        'preservim/vimux',
        enabled = vim.fn.executable "tmux" == 1
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
}

return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
        },
    },
    {
        'neovim/nvim-lspconfig'
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = 'hrsh7th/nvim-cmp',
    },
    {
        'honza/vim-snippets'
    },
}

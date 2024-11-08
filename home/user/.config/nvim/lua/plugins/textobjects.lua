return {
    {
        'kana/vim-textobj-lastpat', -- text-object i/, operate under finding
        dependencies = { 'kana/vim-textobj-user' }
    },
    {
        'sgur/vim-textobj-parameter',
        event = "InsertEnter",
        dependencies = { 'kana/vim-textobj-user' }
    },
    {
        'chaoren/vim-wordmotion',
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
}
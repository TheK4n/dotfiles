return {
    'nvim-telescope/telescope.nvim',
    enabled = vim.fn.executable "fzf" == 1,
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            enabled = vim.fn.executable "make" == 1,
            build = "make"
        }
    },
    keys = {
        { '<Leader>ff', '<cmd>Telescope find_files<CR>' },
        { '<Leader>fg', '<cmd>Telescope live_grep<CR>' },
    }
}

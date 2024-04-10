return {
    {
        'EdenEast/nightfox.nvim',
        config = function()
            local colorscheme = require("nightfox")
            colorscheme.compile()
            colorscheme.setup()
            vim.cmd.colorscheme("nightfox")
        end
    },
    {
        'ellisonleao/gruvbox.nvim'
    },
    {
        'xiyaowong/transparent.nvim',
        config = function()
            require("transparent").setup({
                exclude_groups = {'CursorLine'},
            })
        end
    },
    {
        'lukas-reineke/virt-column.nvim',
        config = function()
            require("virt-column").setup({
                virtcolumn = '+1,81'
            })
        end
    },
}
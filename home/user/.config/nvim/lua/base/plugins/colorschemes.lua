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
}

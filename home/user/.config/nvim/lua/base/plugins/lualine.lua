return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require("lualine").setup()
    end,
    dependencies = { 'kyazdani42/nvim-web-devicons' }
}

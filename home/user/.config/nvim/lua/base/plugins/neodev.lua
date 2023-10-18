return {
    'folke/neodev.nvim',
    ft = {'lua'},
    dependencies = {
        'neovim/nvim-lspconfig'
    },
    config = function()
        require('neodev').setup()
    end
}

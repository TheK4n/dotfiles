return {
    "ellisonleao/dotenv.nvim",
    config = function()
        require('dotenv').setup({
            enable_on_load = true, -- will load your .env file upon loading a buffer
        })

        vim.api.nvim_create_autocmd("BufEnter", {
            pattern = "*", callback = require('dotenv').autocmd
        })
    end
}

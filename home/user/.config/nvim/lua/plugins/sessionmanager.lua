return {
    "folke/persistence.nvim",
    config = function()
        require("persistence").setup()

        vim.api.nvim_create_autocmd("VimEnter", {
            pattern = "*",
            callback = function()
                if (vim.fn.getreg('%') == '') then
                    require("persistence").load()
                end
            end,
            nested = true
        })
    end
}
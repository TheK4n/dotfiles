return {
    'lewis6991/gitsigns.nvim',
    event = "BufReadPost",
    enabled = vim.fn.executable "git" == 1,
    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "+" },
                change = { text = "|" },
                delete = { text = "-" },
                topdelete = { text = "^" },
                changedelete = { text = "~" },
                untracked = { text = "0" },
            }
        })
    end
}
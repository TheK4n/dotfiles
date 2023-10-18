return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                hide_gitignored = true,
                hijack_netrw_behavior = "open_current",
            },
            window = {
                mappings = {
                    ["l"] = "open",
                }
            }
        })
    end
}

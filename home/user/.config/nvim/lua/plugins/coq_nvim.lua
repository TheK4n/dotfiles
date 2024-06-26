return {
    "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
    lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
    dependencies = {
        {
            "ms-jpq/coq_nvim",
            branch = "coq",
            build = ":COQdeps",
        },

        -- 9000+ Snippets
        { "ms-jpq/coq.artifacts", branch = "artifacts" },

        { 'ms-jpq/coq.thirdparty', branch = "3p" }
    },
    init = function()
        vim.g.coq_settings = {
            auto_start = true,
        }

        vim.g.coq_settings = {
            keymap = {
                recommended = true,
            },
        }

        -- Keybindings
        vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<C-c>', [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<BS>', [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
        vim.api.nvim_set_keymap(
            "i",
            "<CR>",
            [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
            { expr = true, silent = true }
        )
        vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
        vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
        end,
    config = function()
        vim.cmd('COQnow -s')
    end,
}
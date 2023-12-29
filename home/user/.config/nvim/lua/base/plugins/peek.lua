return {
    'toppair/peek.nvim',
    event = { "VeryLazy" },
    enabled = vim.fn.executable("deno") == 1,
    ft = {'markdown'},
    keys = {
        { '<Leader>rr', "<cmd>PeekOpen<CR>" }
    },
    build = 'deno task --quiet build:fast',
    config = function()
        local peek = require('peek')

        peek.setup({
            auto_load = true,
            close_on_bdelete = true,
            syntax = true,
            theme = 'dark',
            update_on_change = true,
            app = 'webview',
            filetype = {'markdown'},
            throttle_at = 200000,
            throttle_time = 'auto',
        })

        if vim.fn.executable("i3-msg") then
            vim.api.nvim_create_user_command('PeekOpen', function()
              if not peek.is_open() and vim.bo[vim.api.nvim_get_current_buf()].filetype == 'markdown' then
                vim.fn.system('i3-msg split horizontal')
                peek.open()
              end
            end, {})

            vim.api.nvim_create_user_command('PeekClose', function()
              if peek.is_open() then
                peek.close()
                vim.fn.system('i3-msg move left')
              end
            end, {})
        else
            vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
            vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
        end
    end,
}

return {
    'toppair/peek.nvim',
    enabled = vim.fn.executable "deno" == 1,
    ft = {'markdown'},
    keys = {
        { '<Leader>rr', "<cmd>lua require('peek').open()<CR>" }
    },
    build = 'deno task --quiet build:fast',
    config = function()
        require('peek').setup({
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
    end,
}

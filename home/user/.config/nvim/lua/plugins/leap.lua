return {
    'ggandor/leap.nvim',
    keys = {
        {"J", "<Plug>(leap-forward-to)"},
        {"K", "<Plug>(leap-backward-to)"},
    },
    config = function()
        require('leap').opts.safe_labels = {}
    end,
}
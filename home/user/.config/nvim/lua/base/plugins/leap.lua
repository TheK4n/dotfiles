return {
    'ggandor/leap.nvim',
    config = function()
        require('leap').opts.safe_labels = {}
        local set = vim.keymap.set
        set({'n', 'v'}, 'J', '<Plug>(leap-forward-to)')
        set({'n', 'v'}, 'K', '<Plug>(leap-backward-to)')
    end,
}

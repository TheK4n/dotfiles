return {
    'ggandor/leap.nvim',
    config = function()
        require('leap').opts.safe_labels = {}
    end,
    keys = {
        { 'J', '<Plug>(leap-forward-to)' },
        { 'K', '<Plug>(leap-backward-to)' },
    },
}

function SET_TERM_KEYMAP(bufnr, key, cmd)
    local key_string = string.format([[<Leader>%s]], key)
    local cmd_string = string.format([[<cmd>%s<CR>]], cmd)
    vim.api.nvim_buf_set_keymap(bufnr, 't', key_string, cmd_string, { noremap = true })
end
return {
    "akinsho/toggleterm.nvim",
    config = function()
        local terminal_default = require('toggleterm.terminal').Terminal:new({
            direction = 'horizontal',
            on_open = function(term)
                SET_TERM_KEYMAP(term.bufnr, 't', 'close')
                SET_TERM_KEYMAP(term.bufnr, 'qa', 'qa!')
                SET_TERM_KEYMAP(term.bufnr, 'qq', 'bd!')
            end
        })

        function _TERMINAL_DEFAULT_TOGGLE()
            terminal_default:toggle()
        end

        require("toggleterm").setup({
            direction = "horizontal",
            shell = vim.o.shell,
            hide_numbers = true,
        })
    end,
    keys = {
        {"<Leader>t", "<cmd>lua _TERMINAL_DEFAULT_TOGGLE()<CR>"},
    }
}

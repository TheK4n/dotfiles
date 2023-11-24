
local function set_term_keymap(key, cmd)
    local opts = { noremap = true, silent = true }
    local key_string = string.format([[<Leader>%s]], key)
    local cmd_string = string.format([[<cmd>%s<CR>]], cmd)
    vim.api.nvim_set_keymap('t', key_string, cmd_string, opts)
end

local function set_term_keymaps()
    set_term_keymap('t', 'ToggleTerm')
    set_term_keymap('qa', 'qa!')
    set_term_keymap('qq', 'bd!')
end


return {
    "akinsho/toggleterm.nvim",
    config = function()
        vim.api.nvim_create_autocmd('TermEnter', {
            pattern = 'term://*toggleterm#*',
            callback = set_term_keymaps
        })

        local terminal_default = require('toggleterm.terminal').Terminal:new({
            direction = 'horizontal',
        })

        function _TERMINAL_TOGGLE()
            terminal_default:toggle()
        end

        require("toggleterm").setup({
            direction = "horizontal",
            shell = vim.o.shell,
            hide_numbers = true,
        })
    end,
    keys = {
        {"<Leader>t", "<cmd>lua _TERMINAL_TOGGLE()<CR>"},
    }
}

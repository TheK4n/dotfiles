local map = vim.api.nvim_buf_set_keymap

map(0, 'n', "H", "u", {noremap=false})
map(0, 'n', "h", "-^", {noremap=false})
map(0, 'n', "l", "<CR>", {noremap=false})
map(0, 'n', ".", "gh", {noremap=false})
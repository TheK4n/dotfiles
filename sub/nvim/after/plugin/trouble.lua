
local status, trouble = pcall(require, "trouble")
if (not status) then return end

trouble.setup()


local function set_trouble_keymap(key, cmd)
    local opts = {silent = true, noremap = true}
    vim.keymap.set("n", string.format("<Leader>x%s", key), cmd, opts)
end

set_trouble_keymap("x", "<cmd>TroubleToggle<cr>")
set_trouble_keymap("w", "<cmd>TroubleToggle workspace_diagnostics<cr>")
set_trouble_keymap("d", "<cmd>TroubleToggle document_diagnostics<cr>")
set_trouble_keymap("l", "<cmd>TroubleToggle loclist<cr>")
set_trouble_keymap("q", "<cmd>TroubleToggle quickfix<cr>")

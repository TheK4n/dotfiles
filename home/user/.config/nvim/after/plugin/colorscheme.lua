
local status, colorscheme = pcall(require, "nightfox")
if (not status) then return end

colorscheme.compile()

colorscheme.setup()

vim.cmd.colorscheme("nightfox")


local status, autosave = pcall(require, "gruvbox")
if (not status) then return end

vim.cmd.colorscheme("gruvbox")

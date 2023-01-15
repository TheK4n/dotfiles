
local status, autosave = pcall(require, "gruvbox")
if (not status) then return end

vim.api.nvim_exec('colorscheme gruvbox', true)

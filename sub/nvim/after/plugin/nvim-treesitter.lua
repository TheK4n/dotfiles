
local status, nvim_treesitter = pcall(require, "nvim_treesitter")
if (not status) then return end

nvim_treesitter.setup {
    auto_install = true,
}


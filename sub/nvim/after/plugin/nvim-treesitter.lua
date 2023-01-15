
local status, nvim_treesitter = pcall(require, "nvim-treesitter")
if (not status) then return end

nvim_treesitter.setup {
    auto_install = true,
}


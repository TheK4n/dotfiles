
local status, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

nvim_treesitter.setup {
    ensure_installed = {"python", "lua", "vim", "html", "rust", "markdown"},
    auto_install = true,

    highlight = {
        enable = true,
    }
}


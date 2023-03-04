
local status, nvim_treesitter = pcall(require, "nvim-treesitter")
if (not status) then return end

nvim_treesitter.setup {
    ensure_installed = {"python", "lua", "vim", "html", "rust"},
    sync_install = true,
    auto_install = true,

    highlight = {
        enable = true,
    }
}


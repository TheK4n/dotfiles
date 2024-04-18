
local function install_lazy_if_not_installed(lazypath)
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git", "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath,
        })
    end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
install_lazy_if_not_installed(lazypath)
vim.opt.rtp:prepend(lazypath)


require("lazy").setup(
    "plugins",
    { lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json" }
)
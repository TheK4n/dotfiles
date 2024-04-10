
local function install_lazy_if_not_installed(lazypath)
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git", "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
install_lazy_if_not_installed(lazypath)
vim.opt.rtp:prepend(lazypath)


local plugins = {}

local modules = vim.split(vim.fn.glob(vim.fn.stdpath("config") .. '/lua/*/plugins/*lua'), '\n')

local splitted_path
local module_name
for _, module_path in pairs(modules) do
    splitted_path = vim.split(module_path, '/')
    module_name = splitted_path[#splitted_path]:gsub(".lua", "")

    table.insert(plugins, require('base.plugins.' .. module_name))
end


require("lazy").setup(
    plugins,
    {
        lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json"
    }
)
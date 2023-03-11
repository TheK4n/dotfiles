
local status, ls = pcall(require, "luasnip")
if (not status) then return end


vim.g.snips_author = 'thek4n'
vim.g.snips_email = 'thek4n@yandex.com'
vim.g.snips_github = 'https://github.com/thek4n'


local function jump(val)
    return function()
        ls.jump(val)
    end
end


local map = vim.keymap.set
map({'i', 's'}, '<C-n>', jump(1))
map({'i', 's'}, '<C-p>', jump(-1))


local status_loader, luasnip_loaders = pcall(require, "luasnip.loaders.from_snipmate")
if (not status_loader) then return end

luasnip_loaders.lazy_load()

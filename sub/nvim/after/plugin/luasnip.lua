
local status, _ = pcall(require, "luasnip")
if (not status) then return end

local status_loader, luasnip_loaders = pcall(require, "luasnip.loaders.from_snipmate")
if (not status_loader) then return end

luasnip_loaders.lazy_load()

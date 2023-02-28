
local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not status) then return end


mason_lspconfig.setup()

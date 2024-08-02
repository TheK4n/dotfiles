
local lsp_have_feature = {
    rename = function(client)
        return client.supports_method "textDocument/rename"
    end,
    inlay_hint = function(client)
        return client.supports_method "textDocument/inlayHint"
    end,
}

local function get_lsp_client_names(have_feature)
    local client_names = {}
    local attached_clients = vim.lsp.get_clients { bufnr = 0 }
    for _, client in ipairs(attached_clients) do
        if have_feature(client) then
            table.insert(client_names, client.name)
        end
    end
    return client_names
end

local function lsp_buf_rename(client_name)
    vim.lsp.buf.rename(nil, { name = client_name })
end

function lsp_buf_rename_use_any(fallback)
    local client_names = get_lsp_client_names(lsp_have_feature.rename)
    for _, client_name in ipairs(client_names) do
        lsp_buf_rename(client_name)
        return
    end
    if fallback then
        fallback()
    end
end


local on_attach = function(_, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_set_option_value(...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc', {})

    -- Mappings.

    local opts = { noremap=true, silent=true }

    local function desc(description)
        return vim.tbl_extend("keep", opts, {desc = description})
    end

    -- Sections
    buf_set_keymap('n', '<space>w', '', {desc = "Workspace manage"})

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', desc("Go declaration"))
    buf_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', desc("Go definition"))
    buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', desc("Go implementation"))
    buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', desc("Go references"))
    buf_set_keymap('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', desc("Go type references"))
    buf_set_keymap('n', '<space>k', '<cmd>lua vim.lsp.buf.hover()<CR>', desc("Show help"))
    buf_set_keymap('n', '<space>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', desc("Show signature"))
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', desc("Add workspace folder"))
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', desc("Remove workspace folder"))
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', desc("Show workspace folders"))
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', desc("Show type"))
    buf_set_keymap('n', '<space>rn', "<cmd>lua lsp_buf_rename_use_any()<CR>", desc("Rename object"))
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', desc("Show diagnostic"))
    buf_set_keymap('n', '<space>p', '<cmd>lua vim.diagnostic.goto_prev()<CR>', desc("Previous problem"))
    buf_set_keymap('n', '<space>n', '<cmd>lua vim.diagnostic.goto_next()<CR>', desc("Next problem"))
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', desc("Format file"))
end

return {
    {
        'williamboman/mason.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            "williamboman/mason-lspconfig.nvim",
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            require("mason").setup()
            local mason_lspconfig = require("mason-lspconfig")

            mason_lspconfig.setup()

            mason_lspconfig.setup_handlers({
                function (server_name)
                    require("lspconfig")[server_name].setup({
                        on_attach = on_attach,
                        flags = {
                            debounce_text_changes = 150,
                        }
                    })
                end
            })
        end,
    },
}
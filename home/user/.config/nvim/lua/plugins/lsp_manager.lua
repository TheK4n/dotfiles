
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

function LSP_BUF_RENAME_USE_ANY(fallback)
    local client_names = get_lsp_client_names(lsp_have_feature.rename)
    for _, client_name in ipairs(client_names) do
        lsp_buf_rename(client_name)
        return
    end
    if fallback then
        fallback()
    end
end


return {
    {
        'mason-org/mason.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            "mason-org/mason-lspconfig.nvim",
            'nvim-telescope/telescope.nvim',
        },
        config = function()
            -- Mappings.
            local opts = { noremap=true, silent=true }

            local function desc(description)
                return vim.tbl_extend("keep", opts, {desc = description})
            end

            -- Sections
            vim.api.nvim_set_keymap('n', '<space>w', '', {desc = "Workspace manage"})

            -- See `:help vim.lsp.*` for documentation on any of the below functions
            vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', desc("Go declaration"))
            vim.api.nvim_set_keymap('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', desc("Go definition"))
            vim.api.nvim_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', desc("Go implementation"))
            vim.api.nvim_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', desc("Go references"))
            vim.api.nvim_set_keymap('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', desc("Go type references"))
            vim.api.nvim_set_keymap('n', '<space>k', '<cmd>lua vim.lsp.buf.hover()<CR>', desc("Show help"))
            vim.api.nvim_set_keymap('n', '<space>K', '<cmd>lua vim.lsp.buf.signature_help()<CR>', desc("Show signature"))
            vim.api.nvim_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', desc("Add workspace folder"))
            vim.api.nvim_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', desc("Remove workspace folder"))
            vim.api.nvim_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', desc("Show workspace folders"))
            vim.api.nvim_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', desc("Show type"))
            vim.api.nvim_set_keymap('n', '<space>rn', "<cmd>lua LSP_BUF_RENAME_USE_ANY()<CR>", desc("Rename object"))
            vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', desc("Show diagnostic"))
            vim.api.nvim_set_keymap('n', '<space>p', '<cmd>lua vim.diagnostic.goto_prev()<CR>', desc("Previous problem"))
            vim.api.nvim_set_keymap('n', '<space>n', '<cmd>lua vim.diagnostic.goto_next()<CR>', desc("Next problem"))
            vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
            vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', desc("Format file"))

            require("mason").setup()
            require("mason-lspconfig").setup()
        end,
    },
}

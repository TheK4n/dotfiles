
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
        "ellisonleao/dotenv.nvim",
        config = function()
            require('dotenv').setup({
                enable_on_load = true, -- will load your .env file upon loading a buffer
            })

            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = "*", callback = require('dotenv').autocmd
            })
        end
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("refactoring")
        end,
        keys = {
            { "<space>r", "", desc = "Refactoring", mode = {"n", "v"} },
            {
                "<space>rr",
                ":lua require('refactoring').select_refactor()<CR>",
                desc = "Select refactoring",
                mode = {"n", "x"},
            },
            -- Refactoring operations
            {
                "<space>re",
                "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
                desc = "Extract Function",
                mode = "x",
            },
            {
                "<space>rf",
                "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
                desc = "Extract Function To File",
                mode = "x",
            },
            {
                "<space>rv",
                "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
                desc = "Extract Variable",
                mode = "x",
            },
            {
                "<space>rI",
                "<Esc><Cmd>lua require('refactoring').refactor('Inline Function')<CR>",
                desc = "Inline Function",
                mode = "n",
            },
            {
                "<space>ri",
                "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
                desc = "Inline Variable",
                mode = {"n", "x"},
            },
            -- Extract block
            {
                "<space>rb",
                "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
                desc = "Extract Block",
                mode = "n",
            },
            {
                "<space>rbf",
                "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
                desc = "Extract Block To File",
                mode = "n",
            },
            -- Telescope
            {
                "<leader>fr",
                "<Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
                desc = "Telescope refactorings",
                mode = "n",
            }
        }
    },
    {
        'folke/neodev.nvim',
        ft = {'lua'},
        dependencies = {
            'neovim/nvim-lspconfig'
        },
        config = function()
            require('neodev').setup()
        end
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require("trouble").setup()

            vim.keymap.set("n", "<space>x", "", {desc = "Diagnostics"})
            local function set_trouble_keymap(key, cmd, opts)
                vim.keymap.set(
                    "n",
                    string.format("<space>x%s", key),
                    string.format("<cmd>Trouble %s<CR>", cmd),
                    opts
                )
            end

            set_trouble_keymap("x", "diagnostics toggle", {desc = "Workspace diagnostics window"})
            set_trouble_keymap("X", "diagnostics toggle filter.buf=0", {desc = "Buffer diagnostics window"})
            set_trouble_keymap("Q", "qflist toggle", {desc = "Qflist"})
            set_trouble_keymap("l", "lsp toggle focus=false win.position=right", {desc = "Toggle LSP diagnostics"})

        end
    },
    {
        'lewis6991/gitsigns.nvim',
        event = "BufReadPost",
        enabled = vim.fn.executable "git" == 1,
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "+" },
                    change = { text = "|" },
                    delete = { text = "-" },
                    topdelete = { text = "^" },
                    changedelete = { text = "~" },
                    untracked = { text = "0" },
                },
                signs_staged = {
                    add = { text = '+' },
                    change = { text = '|' },
                    delete = { text = '-' },
                    topdelete = { text = "^" },
                    changedelete = { text = '~' },
                    untracked = { text = '0' },
                },
                signs_staged_enable = true,
            })

            vim.keymap.set("n", "<space>g", "", {desc = "Git actions"})
            local function set_gitsigns_keymap(key, cmd, opts)
                vim.keymap.set(
                    "n",
                    string.format("<space>g%s", key),
                    string.format("<cmd>Gitsigns %s<CR>", cmd),
                    opts
                )
            end

            set_gitsigns_keymap('p', 'preview_hunk', {desc = "Preview hunk"})
            set_gitsigns_keymap('b', 'blame_line', {desc = "Show line commit info"})
            set_gitsigns_keymap('n', 'next_hunk', {desc = "Next changes"})
            set_gitsigns_keymap('N', 'prev_hunk', {desc = "Previous changes"})
            set_gitsigns_keymap('r', 'reset_hunk', {desc = "Reset changes"})
            set_gitsigns_keymap('h', 'toggle_linehl', {desc = "Toggle changes highlight"})
        end
    },
    {
        "wsdjeg/vim-fetch",
    },
    {
        "aznhe21/actions-preview.nvim",
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'MunifTanjim/nui.nvim'
        },
        config = function()
            require("actions-preview").setup {
                telescope = {
                    sorting_strategy = "ascending",
                    layout_strategy = "vertical",
                    layout_config = {
                        width = 0.8,
                        height = 0.9,
                        prompt_position = "top",
                        preview_cutoff = 20,
                        preview_height = function(_, _, max_lines)
                            return max_lines - 15
                        end,
                    },
                },
            }
            vim.keymap.set("n", "<space>c", "", {desc = "Code action"})
            vim.keymap.set("n", "<space>ca", require("actions-preview").code_actions, {desc = "Code action"})
        end,
    },
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        'nvim-telescope/telescope.nvim',
      },
      config = function()
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

        -- Mason настройки
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "gopls",
                "rust_analyzer",
                "ts_ls",
            },
            handlers = {
                function(server_name)
                    local config = vim.deepcopy(require('lspconfig')[server_name].config)
                    config.capabilities = vim.lsp.protocol.make_client_capabilities()
                    vim.lsp.config(server_name, config)
                    vim.lsp.enable(server_name)
                end,
            }
        })
      end
    },
}

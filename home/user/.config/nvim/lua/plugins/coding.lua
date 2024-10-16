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
            "nvim-treesitter/nvim-treesitter",
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
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = "Replace"
                        }
                    }
                }
            })
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
}
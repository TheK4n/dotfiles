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

            local function set_trouble_keymap(key, cmd)
                vim.keymap.set(
                    "n",
                    string.format("<space>x%s", key),
                    string.format("<cmd>Trouble %s<CR>", cmd)
                )
            end

            set_trouble_keymap("x", "diagnostics toggle")
            set_trouble_keymap("X", "diagnostics toggle filter.buf=0")
            set_trouble_keymap("Q", "qflist toggle")
            set_trouble_keymap("l", "lsp toggle focus=false win.position=right")

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
                }
            })

            local function set_gitsigns_keymap(key, cmd)
                vim.keymap.set(
                    "n",
                    string.format("<space>g%s", key),
                    string.format("<cmd>Gitsigns %s<CR>", cmd)
                )
            end

            set_gitsigns_keymap('p', 'preview_hunk') -- show diff
            set_gitsigns_keymap('b', 'blame_line') -- show author, hash, date and message of current line commit
            set_gitsigns_keymap('n', 'next_hunk') -- go to next unstaged changes
            set_gitsigns_keymap('N', 'prev_hunk') -- go to prev unstaged changes
            set_gitsigns_keymap('r', 'reset_hunk') -- reset hunk under cursor
            set_gitsigns_keymap('h', 'toggle_linehl') -- line highlighting
        end
    }
}
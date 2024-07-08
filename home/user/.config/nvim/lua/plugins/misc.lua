return {
    'tpope/vim-repeat',
    'google/vim-searchindex',
    'preservim/vim-pencil',
    {
        'windwp/nvim-autopairs',
        desc = "Auto pair brackets and tags",
        event = "InsertEnter",
        opts = {
            disable_in_macro = true,
        }
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },
    {
        'windwp/nvim-ts-autotag',
        config = function()
            require("nvim-ts-autotag").setup()
        end
    },
    {
        'numToStr/Comment.nvim',
        keys = { { "gc" }, { "gc", mode = "v" } },
        config = function()
            require("Comment").setup()
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = "BufReadPost",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {"python", "lua", "vim", "html", "rust", "markdown", "regex"},
                auto_install = true,
                highlight = {
                    enable = true,
                }
            })
        end
    },
    {
        "thek4n/mdimage.nvim",
        config = function()
            require("mdimage").setup({
                target_path = "./.img",
            })
        end
    },
    {
        "thek4n/postman.nvim",
        keys = {"<leader>rl"},
        cmd = {"PostmanExec"},
        config = function()
            vim.keymap.set("n", "<Leader>rl", '<cmd>PostmanExec<CR>')
        end
    },
    {
        'monaqa/dial.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {"+", "-"},
        config = function()
            local augend = require("dial.augend")

            require("dial.config").augends:register_group{
              default = {
                augend.integer.alias.decimal_int,
                augend.semver.alias.semver,
                augend.constant.alias.bool
              },
            }

            vim.keymap.set("n", "+", function()
                require("dial.map").manipulate("increment", "normal")
            end)
            vim.keymap.set("n", "-", function()
                require("dial.map").manipulate("decrement", "normal")
            end)
        end
    },
    {
        'ggandor/leap.nvim',
        keys = {
            {"J", "<Plug>(leap-forward-to)"},
            {"K", "<Plug>(leap-backward-to)"},
        },
        config = function()
            require('leap').opts.safe_labels = {}
        end,
    },
    {
        'chentoast/marks.nvim',
        config = function()
            require("marks").setup()
        end
    },
    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup({
                mappings = {
                    i = {
                        j = {
                            f = "<ESC>`^"
                        },
                        ["о"] = {
                            ["а"] = "<ESC>`^"
                        }
                    }
                },
                timeout = vim.o.timeoutlen,
            })
        end,
    },
    {
        'Pocco81/auto-save.nvim',
        config = function()
            require("auto-save").setup({
                enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
                execution_message = {
                    message = function() -- message to print on save
                        return ""
                    end,
                    dim = 0.18, -- dim the color of `message`
                    cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
                },
                trigger_events = {"InsertLeave", "TextChanged"}, -- vim events that trigger auto-save. See :h events
                condition = function(buf)
                    local fn = vim.fn
                    local utils = require("auto-save.utils.data")
                    if
                      fn.getbufvar(buf, "&modifiable") == 1 and
                      utils.not_in(fn.getbufvar(buf, "&filetype"), {})
                    then
                            return true -- met condition(s), can save
                    end
                    return false -- can't save
                end,
                write_all_buffers = false, -- write all buffers when the current one meets `condition`
                debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
                    callbacks = { -- functions to be executed at different intervals
                        enabling = nil, -- ran when enabling auto-save
                        disabling = nil, -- ran when disabling auto-save
                        before_asserting_save = nil, -- ran before checking `condition`
                        before_saving = nil, -- ran before doing the actual save
                        after_saving = nil -- ran after doing the actual save
                    }
            })
        end
    },
}
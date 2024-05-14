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
                ensure_installed = {"python", "lua", "vim", "html", "rust", "markdown"},
                auto_install = true,
                highlight = {
                    enable = true,
                }
            })
        end
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require("trouble").setup()
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
}
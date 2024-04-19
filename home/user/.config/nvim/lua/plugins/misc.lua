return {
    'tpope/vim-repeat',
    'google/vim-searchindex',
    'rbgrouleff/bclose.vim',
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
        config = function()
            vim.keymap.set("n", "<Leader>rl", '<cmd>PostmanExec<CR>')
        end
    }
}
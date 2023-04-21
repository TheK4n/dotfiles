
local function install_lazy_if_not_installed(lazypath)
    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system({
            "git", "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        })
    end
end

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
install_lazy_if_not_installed(lazypath)
vim.opt.rtp:prepend(lazypath)


local plugins = {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup({
                mapping = {'jf', 'оа'},
                timeout = vim.o.timeoutlen,
            })
        end,
    },
    {
        'chentoast/marks.nvim',
        config = function()
            require("marks").setup()
        end
    },
    {
        'karb94/neoscroll.nvim',
        config = function()
            require('neoscroll').setup()
        end
    },
    {
        'EdenEast/nightfox.nvim'
    },
    {
        'ellisonleao/gruvbox.nvim'  -- colorscheme
    },
    {
        'kana/vim-textobj-lastpat', -- text-object i/, operate under finding
        dependencies = { 'kana/vim-textobj-user' }
    },
    {
        'tpope/vim-surround'
    },
    {
        'tpope/vim-repeat'
    },
    {
        'google/vim-searchindex'
    },
    {
        'tpope/vim-commentary'  -- gcc to comment line
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    },
    {
        'preservim/tagbar',
        keys = {
            { '<Leader>t', '<cmd>TagbarToggle<CR>' }
        },
        enabled = vim.fn.executable "ctags" == 1
    },
    {
        'preservim/vimux',
        enabled = vim.fn.executable "tmux" == 1
    },
    {
        'rbgrouleff/bclose.vim'
    },
    {
        'Pocco81/auto-save.nvim'  -- autosave files
    },
    {
        'windwp/nvim-autopairs'  -- auto pair brackets and tags
    },
    {
        'lewis6991/gitsigns.nvim'  -- git integration
    },
    {
        'windwp/nvim-ts-autotag'
    },
    {
        'lervag/vimtex'
    },
    {
        'shime/vim-livedown',
        enabled = vim.fn.executable "npm" == 1,
        build = '/usr/bin/npm install -g livedown'
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    {
        'numToStr/Comment.nvim'
    },
    {
        'neovim/nvim-lspconfig'
    },
    {
        'folke/trouble.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' }
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
        }
    },
    {
        'L3MON4D3/LuaSnip',
        dependencies = 'hrsh7th/nvim-cmp',
    },
    {
        'honza/vim-snippets'
    },
    {
        'williamboman/mason.nvim',
        dependencies = "williamboman/mason-lspconfig.nvim"
    },
    {
        'folke/which-key.nvim',
        config = function()
            require("which-key").setup()
        end
    },
    {
        'nvim-telescope/telescope.nvim',
        enabled = vim.fn.executable "fzf" == 1,
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                enabled = vim.fn.executable "make" == 1,
                build = "make"
            }
        },
        keys = {
            { '<Leader>ff', '<cmd>Telescope find_files<CR>' },
            { '<Leader>fg', '<cmd>Telescope live_grep<CR>' },
        }
    },
    {
        'nmac427/guess-indent.nvim',
        config = function()
            require('guess-indent').setup {}
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require('indent_blankline').setup {
                char = "▏",
                char_highlight_list = { "IndentBlanklineIndent1" },
                show_trailing_blankline_indent = false,
                use_treesitter = true,
            }
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("neo-tree").setup({
                close_if_last_window = true,
                filesystem = {
                    hide_gitignored = true,
                    hijack_netrw_behavior = "open_current",
                },
                window = {
                    mappings = {
                        ["l"] = "open",
                    }
                }
            })
        end
    },
    {
        'folke/neodev.nvim',
        dependencies = {
            'neovim/nvim-lspconfig'
        },
        config = function()
            require('neodev').setup()
        end
    },
}

require("lazy").setup(
    plugins,
    {
        lockfile = vim.fn.stdpath "data" .. "/lazy-lock.json"
    }
)

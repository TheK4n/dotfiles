local border_opts = {
  border = "single",
  winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
}

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function setup_cmp()
    local cmp = require("cmp")

    cmp.setup({
        completion = {
            autocomplete = {'TextChanged'}
        },
        snippet = {
            expand = function(args)
            require('luasnip').lsp_expand(args.body)
            end,
        },
        mapping = {
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
        },
        window = {
            completion = cmp.config.window.bordered(border_opts),
            documentation = cmp.config.window.bordered(border_opts),
        },
        sorting = {
            priority_weight = 1.0,
            comparators = {
                cmp.config.compare.locality,
                cmp.config.compare.recently_used,
                cmp.config.compare.score,
                cmp.config.compare.offset,
                cmp.config.compare.order,
            },
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp', priority = 1250 },
            { name = 'luasnip', priority = 1000 },
            { name = 'buffer', priority = 750 },
            { name = "dotenv", priority = 500 },
            { name = 'path', priority = 250 },
        }),
    })
end

return {
    {
        'L3MON4D3/LuaSnip',
        event = "InsertEnter",
        build = "make install_jsregexp",
        dependencies = {
            'hrsh7th/nvim-cmp',
            'honza/vim-snippets',
        },
        config = function()
            local ls = require("luasnip")

            vim.g.snips_author = 'thek4n'
            vim.g.snips_email = 'thek4n@yandex.com'
            vim.g.snips_github = 'https://github.com/thek4n'

            local function jump(val)
                return function()
                    ls.jump(val)
                end
            end

            local map = vim.keymap.set
            map({'i', 's'}, '<C-n>', jump(1))
            map({'i', 's'}, '<C-p>', jump(-1))


            local luasnip_loaders = require("luasnip.loaders.from_snipmate")

            luasnip_loaders.lazy_load()
        end
    },
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'lukas-reineke/cmp-under-comparator',
            'SergioRibera/cmp-dotenv'
        },
        config = setup_cmp,
    },
    {
        'neovim/nvim-lspconfig',
        event = "InsertEnter",
    },
}
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
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
                vim.snippet.expand(args.body)
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ['<Tab>'] = cmp.mapping(
                function(fallback)
                    if cmp.visible() then
                        cmp.confirm({
                            behavior = cmp.ConfirmBehavior.Select,
                            select = true,
                        })
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end,
                { "i", "s" }
            ),
            ['<C-k>'] = cmp.mapping.select_prev_item({ behaviour = cmp.SelectBehavior.Select }),
            ['<C-j>'] = cmp.mapping.select_next_item({ behaviour = cmp.SelectBehavior.Select }),
            ['<C-p>'] = cmp.mapping.scroll_docs(4),
            ['<C-n>'] = cmp.mapping.scroll_docs(-4),
            ['<C-e>'] = cmp.mapping.abort(),
        }),
        window = {
            completion = cmp.config.window.bordered(border_opts),
            documentation = cmp.config.window.bordered(border_opts),
        },
        sorting = {
            priority_weight = 1.0,
            comparators = {
                cmp.config.compare.score,
                cmp.config.compare.locality,
                cmp.config.compare.recently_used,
                cmp.config.compare.offset,
                require("cmp-under-comparator").under,
                cmp.config.compare.order,
            },
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp', priority = 1500 },
            { name = 'luasnip', priority = 1250 },
            { name = 'buffer', priority = 1000 },
            { name = 'tmux', priority = 750 },
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
            map({'i', 's'}, '<C-n>', jump(1), {silent = true})
            map({'i', 's'}, '<C-p>', jump(-1), {silent = true})
            map({'i', 's'}, '<C-k>', ls.expand, {silent = true})
            map({"i", "s"}, "<C-e>",
                function()
                    if ls.choice_active() then
                        ls.change_choice(1)
                    end
                end,
                {silent = true}
            )

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
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'lukas-reineke/cmp-under-comparator',
            'SergioRibera/cmp-dotenv',
            'andersevenrud/cmp-tmux',
        },
        config = setup_cmp,
    },
    {
        'neovim/nvim-lspconfig',
        event = "InsertEnter",
    },
}
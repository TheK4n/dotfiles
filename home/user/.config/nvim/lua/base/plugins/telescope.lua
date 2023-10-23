return {
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
        { '<Leader>fc', '<cmd>Telescope git_commits<CR>' },
        { '<Leader>fd', '<cmd>Telescope diagnostics<CR>' },
    },
    config = function()
        local telescope = require("telescope")

        telescope.load_extension("fzf")

        telescope.setup({
            pickers = {
                find_files = {
                    hidden = true
                },
            },
            defaults = {
                selection_caret = " ",
                path_display = { "smart" },
                file_ignore_patterns = {
                    ".git/",
                    "target/",
                    "docs/",
                    "vendor/*",
                    "%.lock",
                    "pycache/*",
                    "%.sqlite3",
                    "%.ipynb",
                    "node_modules/*",
                    "%.svg",
                    "%.otf",
                    "%.ttf",
                    "%.webp",
                    ".dart_tool/",
                    ".github/",
                    ".gradle/",
                    ".idea/",
                    ".settings/",
                    ".vscode/",
                    "pycache/",
                    "build/",
                    "env/",
                    "gradle/",
                    "node_modules/",
                    "%.pdb",
                    "%.dll",
                    "%.class",
                    "%.exe",
                    "%.cache",
                    "%.ico",
                    "%.pdf",
                    "%.dylib",
                    "%.jar",
                    "%.docx",
                    "%.met",
                    "smalljre_*/*",
                    ".vale/",
                    "%.burp",
                    "%.mp4",
                    "%.mkv",
                    "%.rar",
                    "%.zip",
                    "%.7z",
                    "%.tar",
                    "%.bz2",
                    "%.epub",
                    "%.flac",
                    "%.tar.gz",
                },
            }
        })
    end
}

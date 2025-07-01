local opt = vim.opt


opt.ruler = true
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.number = true
opt.relativenumber = true


opt.clipboard:append { 'unnamed' }
opt.clipboard:append { 'unnamedplus' }

opt.shortmess:append{a = true, s = true, I = true, c = true, S = true}

opt.cmdheight = 0
vim.wo.signcolumn = "yes:1"

opt.shell = vim.env.SHELL

opt.ttimeoutlen = 50
opt.timeoutlen = 500

opt.pumheight = 15

opt.compatible = false

opt.hidden = true

-- indent
opt.expandtab = true  -- spaces instead of tab
opt.smarttab = true
opt.tabstop = 4  -- 1 tab appears number spaces
opt.softtabstop = 4
opt.shiftwidth = vim.bo.tabstop  -- insert tab or shift inserting .shiftwidth*.tabstop spaces or .shiftwidth/.tabstop tabs
opt.autoindent = true
opt.smartindent = true

-- tabline
opt.showtabline = 0

opt.cursorline = true
opt.wrap = false

opt.ttyfast = true
opt.autoread = true

opt.errorbells = false
opt.visualbell = false
opt.showcmd = true

opt.ignorecase = true
opt.smartcase = true -- if search line hasn`t Upper case chars - ignore case search, else case-sensivity search
opt.incsearch = true

opt.mousehide = true
opt.mouse = 'a'

opt.scrolloff = 999


COLUMN_NUMBER_BEFORE_INSERT=1

vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        _, COLUMN_NUMBER_BEFORE_INSERT = unpack(vim.api.nvim_win_get_cursor(0))
    end,
})


-- disable paste comment on new line
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {"*"},
    callback = function()
        opt.formatoptions:remove("c")
        opt.formatoptions:remove("r")
        opt.formatoptions:remove("o")
    end,
})


opt.termguicolors = true

opt.background = 'dark'

opt.backup = true
opt.swapfile = false
opt.undofile = true
opt.history = 1000
opt.undoreload = 1000

local prefix = vim.fn.expand("~/.local/state/nvim")

opt.undodir = { prefix .. "/undo//" }
opt.backupdir = { prefix .. "/backup//" }
opt.directory = { prefix .. "/swap//" }


local function makeDirIfNoExists(path)
    path = path["_value"]
    if (vim.fn.isdirectory(path) == 0) then
        vim.fn.mkdir(path, "p")
    end
end

-- make this dirs if no exists previously
makeDirIfNoExists(opt.undodir)
makeDirIfNoExists(opt.backupdir)
makeDirIfNoExists(opt.directory)

opt.ffs = 'unix,mac'

opt.path:append { '**' } -- Finding files - Search down into subfolders


vim.g.t_SI = [[\e[5 q]]
vim.g.t_SR = [[\e[3 q]]
vim.g.t_EI = [[\e[1 q]]

-- SI - режим вставки
-- SR - режим замены
-- EI - нормальный режим


vim.g.netrw_banner = 0 -- hide banner
vim.g.highlighturl_enabled = true -- highlight URLs by default


-- Highlight yanked text for a while
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.cmd.highlight({ "DiagnosticError", "guifg=Grey" })
vim.cmd.highlight({ "DiagnosticWarn", "guifg=Grey" })
vim.cmd.highlight({ "DiagnosticInfo", "guifg=Grey" })
vim.cmd.highlight({ "DiagnosticHint", "guifg=Grey" })

-- Russian commands
opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'


vim.o.viewdir = vim.fn.stdpath('cache')..'/view'
vim.fn.mkdir(vim.o.viewdir, 'p')
opt.viewoptions = "folds,cursor"

vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = {"?*"},
    callback = function(args)
        local bufname = vim.api.nvim_buf_get_name(args.buf)
        if not bufname:match("^term://") then
            vim.cmd.mkview(1)
        end

    end
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = {"?*"},
    callback = function(args)
        local bufname = vim.api.nvim_buf_get_name(args.buf)
        if not bufname:match("^term://") then
            vim.cmd([[silent! loadview 1]])
        end
    end,
})

vim.opt.foldcolumn = "1"

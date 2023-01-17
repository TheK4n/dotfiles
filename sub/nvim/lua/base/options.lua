
vim.opt.ruler = true


vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.shell = 'bash'

vim.opt.ttimeoutlen = 0

vim.opt.compatible = false

vim.opt.hidden = true

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.tabstop = 4


vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.ttyfast = true
vim.opt.autoread = true


vim.opt.errorbells = false
vim.opt.visualbell = false
vim.opt.showcmd = true
vim.opt.showtabline = 2

vim.opt.smartcase = true -- if search line hasn`t Upper case chars - ignore case search, else case-sensivity search
vim.opt.incsearch = true

vim.opt.mousehide = true
vim.opt.mouse = 'a'

vim.opt.colorcolumn = '81'
vim.opt.scrolloff = 7


vim.opt.termguicolors = true
vim.opt.background = 'dark'

vim.opt.backup = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.history = 1000
vim.opt.undoreload = 1000

local prefix = vim.fn.expand("~/.cache/nvim/tmp")

vim.opt.undodir = { prefix .. "/undo//" }
vim.opt.backupdir = { prefix .. "/backup//" }
vim.opt.directory = { prefix .. "/swp//" }


function makeDirIfNoExists(path)
    local path = path["_value"]
    if (vim.fn.isdirectory(path) == 0) then
        vim.fn.mkdir(path, "p")
    end
end

-- make this dirs if no exists previously
makeDirIfNoExists(vim.opt.undodir)
makeDirIfNoExists(vim.opt.backupdir)
makeDirIfNoExists(vim.opt.directory)

vim.opt.ffs = 'unix,mac'

vim.opt.path:append { '**' } -- Finding files - Search down into subfolders


vim.cmd([[
    let &t_SI.="\e[5 q" "SI = режим вставки
    let &t_SR.="\e[3 q" "SR = режим замены
    let &t_EI.="\e[1 q" "EI = нормальный режим
]])


vim.g.netrw_banner = 0 -- hide banner
vim.g.netrw_liststyle = 3 -- tree instead of plain view
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 15
vim.g.netrw_keepdir = 0


-- Highlight yanked text for a while
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- dont auto commenting new lines
vim.api.nvim_create_autocmd("BufEnter", {pattern = "*", command = [[set fo-=c fo-=r fo-=o]]})

vim.cmd.highlight({ "DiagnosticError", "guifg=Grey" })
vim.cmd.highlight({ "DiagnosticWarn", "guifg=Grey" })
vim.cmd.highlight({ "DiagnosticInfo", "guifg=Grey" })
vim.cmd.highlight({ "DiagnosticHint", "guifg=Grey" })

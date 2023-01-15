
vim.opt.ruler = true


vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.clipboard = 'unnamedplus'
vim.opt.shell = 'bash'

vim.opt.ttimeoutlen = 0

-- vim.opt.compatible = false 

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

vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.mousehide = true
vim.opt.mouse = 'a'

vim.opt.colorcolumn = '81'
vim.opt.scrolloff = 7

vim.opt.backup = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.history = 1000
vim.opt.undoreload = 1000

local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand("~/.config")

vim.opt.undodir = { prefix .. "/nvim/tmp/.undo//"}
vim.opt.backupdir = {prefix .. "/nvim/tmp/.backup//"}
vim.opt.directory = { prefix .. "/nvim/tmp/.swp//"}

vim.api.nvim_exec([[
    function! MakeDirIfNoExists(path)
        if !isdirectory(expand(a:path))
            call mkdir(expand(a:path), "p")
        endif
    endfunction

    " make this dirs if no exists previously
    silent! call MakeDirIfNoExists(&undodir)
    silent! call MakeDirIfNoExists(&backupdir)
    silent! call MakeDirIfNoExists(&directory)
]], true)

vim.opt.ffs = 'unix,mac'

vim.opt.path:append { '**' } -- Finding files - Search down into subfolders

vim.opt.cursorline = true



vim.cmd([[let &t_SI.="\e[5 q"]])
vim.cmd([[let &t_SR.="\e[3 q"]])
vim.cmd([[let &t_EI.="\e[1 q"]])


vim.cmd([[let g:netrw_banner = 0]]) -- hide banner
vim.cmd([[let g:netrw_liststyle = 3]]) -- tree instead of plain view
vim.cmd([[let g:netrw_browse_split = 0]])
vim.cmd([[let g:netrw_winsize = 15]])
vim.cmd([[let g:netrw_keepdir = 0]])

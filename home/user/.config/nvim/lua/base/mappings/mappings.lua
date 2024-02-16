local map = vim.keymap.set


vim.g.mapleader = ','


local function create_function_tabdo(command)
    return function()
        local curr_tab = vim.fn.tabpagenr()
        vim.cmd.tabdo(command)
        vim.cmd.tabn(curr_tab)
    end
end

map('n', '<Leader>hc', create_function_tabdo('set cursorline!'),
    {desc = "Toggle line highlighting"})

map('n', '<Leader>h/',
    function() vim.opt.hlsearch = not vim.opt.hlsearch["_value"] end,
    {desc = "Toggle search highlighting"})


-- enable search highlight in search mode
map('n', '/', ':set hlsearch<CR>/')

-- copy selection to search line
map('v', '<C-f>', '"fy:set hlsearch<CR>/\\V<C-r>f\\C<CR>')

-- copy word under cursor to search line
map('n', '<C-f>', ':set hlsearch<CR>/\\V<C-r><C-w>\\C<CR>')

map('n', '<Leader>hl', create_function_tabdo('lua toggle_number_style()'),
    {desc = "Toggle line number style"})

map('i', 'jf', '<ESC>`^')
map('i', 'оа', '<ESC>`^')

map('n', '<Enter>', 'o<ESC>')
map('n', '<Space>', 'O<ESC>')

-- x to blackhole
map({'n', 'v'}, 'x', '"_x')
map('n', '<bs>', '"_X')


-- Put without overwrite yanked text
map('v', 'p', 'P')


-- Increment/decrement
map('n', '+', '<C-a>')
map('n', '-', '<C-x>')

-- map \ to prev finding
map({"n", "v"}, [[\]], ',')

-- Select all
map('n', '<C-a>', 'mvggVG')
map('v', '<C-a>', '<Esc>`v:delmarks v<CR>', {silent = true})


-- Scroll tabs
map("n", '<C-l>', vim.cmd.tabnext)
map("n", '<C-h>', vim.cmd.tabprev)


-- Open file under cursor in new tab
map("n", 'gf', '<C-w>gf')


map("n", '<Leader>qq', '<cmd>bd!<CR>',
    {desc = "Kill current buffer"})

map("n", '<Leader>qa', '<cmd>qa!<CR>',
    {desc = "Exit without saving"})


map("n", '<Leader>he', '<cmd>set list!<CR>',
    {desc = "Show hidden symbols"})
vim.opt.listchars=[[tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶]]


-- Expand %% to dirname of current file in command line
map("c", '%%', [[getcmdtype() == ':' ? expand('%:h').'/' : '%%']], {expr = true})


-- Save from root
vim.api.nvim_create_user_command('W', [[execute 'silent! write !SUDO_ASKPASS=vim_askpass_helper sudo -A tee % >/dev/null' <bar> edit!]], {})
vim.cmd([[autocmd FileChangedRO * set readonly!]])


-- Toggle line number style
function toggle_number_style()
    local opt = vim.opt
    local number = opt.number["_value"]
    local relativenumber = opt.relativenumber["_value"]

    if (not number) and (not relativenumber) then
        opt.number = true
        opt.relativenumber = false
    elseif (number) and (not relativenumber) then
        opt.number = false
        opt.relativenumber = true
    elseif (not number) and (relativenumber) then
        opt.number = true
        opt.relativenumber = true
    elseif (number) and (relativenumber) then
        opt.number = false
        opt.relativenumber = false
    end
end




local function set_trouble_keymap(key, cmd)
    map("n", string.format("<space>x%s", key), string.format("<cmd>TroubleToggle %s<CR>", cmd))
end

set_trouble_keymap("x", "")
set_trouble_keymap("w", "workspace_diagnostics") -- lsp diagnostic of workspace
set_trouble_keymap("d", "document_diagnostics") -- diagnostic of current file


local function set_gitsigns_keymap(key, cmd)
    map("n", string.format("<space>g%s", key), string.format("<cmd>Gitsigns %s<CR>", cmd))
end

set_gitsigns_keymap('p', 'preview_hunk') -- show diff
set_gitsigns_keymap('b', 'blame_line') -- show author, hash, date and message of current line commit
set_gitsigns_keymap('n', 'next_hunk') -- go to next unstaged changes
set_gitsigns_keymap('N', 'prev_hunk') -- go to prev unstaged changes
set_gitsigns_keymap('r', 'reset_hunk') -- reset hunk under cursor
set_gitsigns_keymap('h', 'toggle_linehl') -- line highlighting


map("n", "<Leader>pl", "<cmd>Lazy<CR>",
    {desc = "Package manager"})

map("n", "<Leader>pm", "<cmd>Mason<CR>",
    {desc = "LSP Manager"})
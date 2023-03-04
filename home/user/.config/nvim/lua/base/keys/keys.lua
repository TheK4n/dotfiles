local map = vim.keymap.set
local opts = { noremap = true, silent = true }


vim.g.mapleader = ','


local function create_function_tabdo(command)
    return function()
        local curr_tab = vim.fn.tabpagenr()
        vim.cmd.tabdo(command)
        vim.cmd.tabn(curr_tab)
    end
end

-- Toggle line highlighting
map('n', '<Leader>c', create_function_tabdo('set cursorline!'), opts)

map('n', '<Leader>/',
    function() vim.opt.hlsearch = not vim.opt.hlsearch["_value"] end,
    opts)

map('i', 'jk', '<ESC>', opts)

map('n', '<Enter>', 'o<ESC>', opts)
map('n', '<Space>', 'O<ESC>', opts)

-- x to blackhole
map({'n', 'v'}, 'x', '"_x', opts)


-- Put without overwrite yanked text
map('x', 'p', 'P', opts)


-- Increment/decrement
map('n', '+', '<C-a>', opts)
map('n', '-', '<C-x>', opts)

-- map \ to prev finding
map({"n", "v"}, [[\]], ',', opts)

-- Select all
map('n', '<C-a>', 'gg<S-v>G', opts)


-- Scroll tabs
map("n", '<C-l>', vim.cmd.tabnext, opts)
map("n", '<C-h>', vim.cmd.tabprev, opts)


-- Open file under cursor in new tab
map("n", 'gf', '<C-w>gf')


-- Kill current buffer
map("n", '<Leader>qq', '<cmd>bd!<CR>', opts)
-- Quick exit without saving
map("n", '<Leader>qa', '<cmd>qa!<CR>', opts)


map("n", '<Leader>eh', '<cmd>set list!<CR>', opts)
vim.opt.listchars=[[tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶]]


-- Tags panel (ctags required)
map("n", '<Leader>t', '<cmd>TagbarToggle<CR>', opts)


-- Telescope
map("n", '<Leader>ff', '<cmd>Telescope find_files<CR>', opts)
map("n", '<Leader>fg', '<cmd>Telescope live_grep<CR>', opts)


-- Expand %% to dirname of current file in command line
map("c", '%%', [[getcmdtype() == ':' ? expand('%:h').'/' : '%%']], {expr = true})


-- Save from root
vim.api.nvim_create_user_command('Sw', [[execute 'silent! write !SUDO_ASKPASS=$(command -v vim_askpass_helper) sudo -A tee % >/dev/null']], {})



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

-- Toggle line number style
map('n', '<Leader>l', create_function_tabdo('lua toggle_number_style()'), opts)



local function set_trouble_keymap(key, cmd)
    map("n", string.format("<Leader>x%s", key), string.format("<cmd>TroubleToggle %s<CR>", cmd), opts)
end

set_trouble_keymap("x", "")
set_trouble_keymap("w", "workspace_diagnostics") -- lsp diagnostic of workspace
set_trouble_keymap("d", "document_diagnostics") -- diagnostic of current file


local function set_gitsigns_keymap(key, cmd)
    map("n", string.format("<Leader>g%s", key), string.format("<cmd>Gitsigns %s<CR>", cmd), opts)
end

set_gitsigns_keymap('p', 'preview_hunk') -- show diff
set_gitsigns_keymap('b', 'blame_line') -- show author, hash, date and message of current line commit
set_gitsigns_keymap('n', 'next_hunk') -- go to next unstaged changes

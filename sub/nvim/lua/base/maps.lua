local keymap = vim.keymap


vim.g.mapleader = ','


function create_function_tabdo(command)
    return function()
        local currTab = vim.fn.tabpagenr()
        vim.cmd(string.format([[tabdo %s]], command))
        vim.cmd(string.format([[tabn %s]], currTab))
    end
end

keymap.set('n', '<Leader>c', create_function_tabdo('set cursorline!'), {silent = true})

keymap.set('n', '<Leader>/', [[:set invhlsearch<CR>]], {silent = true})

keymap.set('i', 'jk', '<ESC>', {silent = true})
keymap.set('i', 'ол', '<ESC>', {silent = true})



-- x to blackhole
keymap.set('n', 'x', '"_x', {silent = true})

-- Increment/decrement
keymap.set('n', '+', '<C-a>', {silent = true})
keymap.set('n', '-', '<C-x>', {silent = true})

-- map \ to prev finding
keymap.set('n', [[\]], ',', {silent = true})
keymap.set('v', [[\]], ',', {silent = true})

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G', {silent = true})


-- Scroll tabs
keymap.set("n", '<C-l>', ':tabnext<CR>', {silent = true})
keymap.set("n", '<C-h>', ':tabprev<CR>', {silent = true})


-- Kill current buffer
keymap.set("n", '<Leader>qq', ':bd!<CR>', {silent = true})
-- Quick exit without saving
keymap.set("n", '<Leader>qa', ':qa!<CR>', {silent = true})


keymap.set("n", '<Leader>eh', ':set list!<CR>', {silent = true})
vim.opt.listchars=[[tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶]]


-- Tags panel (ctags required)
keymap.set("n", '<Leader>t', ':TagbarToggle<CR>', {silent = true})


-- Telescope
keymap.set("n", '<Leader>ff', '<cmd>Telescope find_files<CR>', {silent = true})
keymap.set("n", '<Leader>fg', '<cmd>Telescope live_grep<CR>', {silent = true})


-- Expand %% to dirname of current file in command line
keymap.set("c", '%%', [[getcmdtype() == ':' ? expand('%:h').'/' : '%%']], {expr = true})


-- Save from root
vim.api.nvim_create_user_command('Sw', [[execute 'silent! write !SUDO_ASKPASS=$(which vim_askpass_helper) sudo -A tee % >/dev/null']], {})



function create_autocmd_filetype(func) 
    create_autocmd = vim.api.nvim_create_autocmd

    create_autocmd("BufEnter", 
        { pattern = '*', callback = func}
    )
end

function set_keymap_run_script(cmd)
    cmd_string = string.format([[:tabnew %% <CR> :terminal %s %% <CR> :set nocursorline number norelativenumber <CR> G <CR>]], cmd)
    keymap.set("n", "<Leader>rr", cmd_string, {silent = true})
end

function create_function_create_autocmd_filetype(ft, cmd)
    return function()
        if vim.bo.filetype == ft then
            set_keymap_run_script(cmd)
        end
    end
end

function create_function_create_autocmd_filename(fn, cmd)
    return function()
        if vim.fn.expand('%:t') == fn then
            set_keymap_run_script(cmd)
        end
    end
end


create_autocmd_filetype(create_function_create_autocmd_filetype('python', 'python3'))
create_autocmd_filetype(create_function_create_autocmd_filetype('go', 'go run'))
create_autocmd_filetype(create_function_create_autocmd_filetype('rust', 'cargo run'))
create_autocmd_filetype(create_function_create_autocmd_filetype('markdown', 'glow'))

create_autocmd_filetype(create_function_create_autocmd_filename('manpage', 'man -P cat -l'))




-- Toggle line number style
vim.opt.number = true
vim.opt.relativenumber = true


function toggle_number_style()

    local number = vim.opt.number["_value"]
    local relativenumber = vim.opt.relativenumber["_value"]

    if (not number) and (not relativenumber) then
        vim.opt.number = true
        vim.opt.relativenumber = false
    elseif (number) and (not relativenumber) then
        vim.opt.number = false
        vim.opt.relativenumber = true
    elseif (not number) and (relativenumber) then
        vim.opt.number = true
        vim.opt.relativenumber = true
    elseif (number) and (relativenumber) then
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
end

-- Toggle line number style
keymap.set('n', '<Leader>l', create_function_tabdo('lua toggle_number_style()'), {silent = true})

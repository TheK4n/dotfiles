local keymap = vim.keymap


vim.g.mapleader = ','


vim.api.nvim_exec([[
    " like tabdo but restore the current tab
    function! TabDo(command)
        let currTab=tabpagenr()
        execute 'tabdo ' . a:command
        execute 'tabn ' . currTab
    endfunction

    " like bufdo but restore the current buffer
    function! BufDo(command)
      let currBuff=bufnr("%")
      execute 'bufdo ' . a:command
      execute 'buffer ' . currBuff
    endfunction

    " like windo but restore the current window
    function! WinDo(command)
      let currwin=winnr()
      execute 'windo ' . a:command
      execute currwin . 'wincmd w'
    endfunction
]], true)

keymap.set('n', '<Leader>c', [[:call TabDo('set cursorline!')<CR>]], {silent = true})

keymap.set('n', '<Leader>/', [[:set invhlsearch<CR>]], {silent = true})

keymap.set('i', 'jk', '<ESC>', {silent = true})
keymap.set('i', 'ол', '<ESC>', {silent = true})



-- x to blackhole
keymap.set('n', 'x', '"_x', {silent = true})

-- Increment/decrement
keymap.set('n', '+', '<C-a>', {silent = true})
keymap.set('n', '-', '<C-x>', {silent = true})

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

function create_func(ft, cmd)
    return function()
        if vim.bo.filetype == ft then
            cmd_string = string.format([[:tabnew %% <CR> :terminal %s %% <CR> :set nocursorline number norelativenumber <CR> G <CR>]], cmd)
            keymap.set("n", "<Leader>rr", cmd_string, {silent = true})
        end
    end
end

create_autocmd_filetype(create_func('python', 'python3'))
create_autocmd_filetype(create_func('go', 'go run'))
create_autocmd_filetype(create_func('rust', 'cargo run'))




-- Toggle line number style
vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_exec([[
function! ToggleRelativeAbsoluteNumber()
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction
]], true)

keymap.set('n', '<Leader>l', [[:call TabDo('call ToggleRelativeAbsoluteNumber()') <CR>]], {silent = true})

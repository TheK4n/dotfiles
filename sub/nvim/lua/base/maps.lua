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

keymap.set('i', 'jk', '<ESC>')
keymap.set('i', 'ол', '<ESC>')



-- x to blackhole
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')


-- Scroll tabs
keymap.set("n", '<C-l>', ':tabnext<CR>')
keymap.set("n", '<C-h>', ':tabprev<CR>')


-- Kill current buffer
keymap.set("n", '<Leader>qq', ':bd!<CR>')
-- Quick exit without saving
keymap.set("n", '<Leader>qa', ':qa!<CR>')


keymap.set("n", '<Leader>eh', ':set list!<CR>')
vim.opt.listchars=[[tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶]]


-- Tags panes (ctags required)
keymap.set("n", '<Leader>t', ':TagbarToggle<CR>')


-- Telescope
keymap.set("n", '<Leader>ff', '<cmd>Telescope find_files<CR>')
keymap.set("n", '<Leader>fg', '<cmd>Telescope live_grep<CR>')


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

function set_keymap_run_script()
    if vim.bo.filetype == 'python' then
        cmd_string = string.format([[:tabnew %% <CR> :terminal %s %% <CR> :set nocursorline number norelativenumber <CR> G <CR>]], 'python3')
        keymap.set("n", "<Leader>rr", cmd_string)
    end
end

create_autocmd_filetype(set_keymap_run_script)




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

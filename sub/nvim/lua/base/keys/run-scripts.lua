
local function autocmd(func)
    local create_autocmd = vim.api.nvim_create_autocmd

    create_autocmd("BufEnter",
        { pattern = '*', callback = func}
    )
end

local function set_keymap_base(key, cmd)
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    local keymap_keys = string.format([[<Leader>r%s]], key)
    map("n", keymap_keys, cmd, opts)
end

local function set_keymap_format_file(cmd)
    local cmd_string = string.format([[:!%s %% <CR>]], cmd)
    set_keymap_base("f", cmd_string)
end

local function set_keymap_run_script_base(key, cmd)
    local run_script_string = [[:tabnew %% <CR> :terminal %s %% <CR> :set nocursorline number norelativenumber <CR> G <CR>]]
    local cmd_string = string.format(run_script_string, cmd)
    set_keymap_base(key, cmd_string)
end

local function set_keymap_run_script(cmd)
    set_keymap_run_script_base("r", cmd)
end

local function set_keymap_run_script_by_shebang()
    set_keymap_run_script_base("s", [[$(head -1 % | cut -c 3-) %]])
end

local function create_function_autocmd_by_filetype(set_keymap_func, ft, cmd)
    return function()
        if vim.bo.filetype == ft then
            set_keymap_func(cmd)
        end
    end
end

local function create_function_autocmd_by_filename(set_keymap_func, fn, cmd)
    return function()
        if vim.fn.expand('%:t') == fn then
            set_keymap_func(cmd)
        end
    end
end

local function autocmd_run_script_by_filetype(ft, cmd)
    autocmd(create_function_autocmd_by_filetype(set_keymap_run_script, ft, cmd))
end

local function autocmd_format_file_by_filetype(ft, cmd)
    autocmd(create_function_autocmd_by_filetype(set_keymap_format_file, ft, cmd))
end


autocmd_run_script_by_filetype('python', 'python3')
autocmd_run_script_by_filetype('go', 'go run')
autocmd_run_script_by_filetype('rust', 'cargo run')
autocmd_run_script_by_filetype('markdown', 'glow')

autocmd(create_function_autocmd_by_filename(set_keymap_run_script, 'manpage', 'man -P cat -l'))

autocmd_format_file_by_filetype('rust', 'cargo fmt -p')
autocmd_format_file_by_filetype('go', 'go fmt')

autocmd(set_keymap_run_script_by_shebang)

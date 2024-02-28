

local function map_filetype(filetype, key, cmd)
    local function format_string()
        local run_script_string = [[:tabnew %% | :terminal %s <CR> :set nocursorline number norelativenumber <CR> G]]
        local cmd_string = string.format(run_script_string, cmd)

        local map = vim.keymap.set
        local opts = { noremap = true, silent = true }
        map('n', key, cmd_string, opts)
    end


    vim.api.nvim_create_autocmd("FileType",
        { pattern = filetype, callback = format_string}
    )
end

map_filetype('nroff', '<Leader>rr', 'man -P cat -l %')

map_filetype('*', '<Leader>rs', '$(head -1 % | cut -c 3-) %')

map_filetype('python', '<Leader>rr', 'python3 %')
map_filetype('python', '<Leader>rt', 'pytest %')

map_filetype('go', '<Leader>rr', 'go run')

map_filetype('rust', '<Leader>rr', 'cargo run')

map_filetype('c', '<Leader>rr', 'gcc % && ./a.out')
map_filetype('cpp', '<Leader>rr', 'g++ % && ./a.out')
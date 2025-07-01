

local function map_filetype(filetype, key, cmd)
    local function format_string()
        local run_script_string = [[:terminal %s <CR> :set nocursorline number norelativenumber <CR> G]]
        local cmd_string = string.format(run_script_string, cmd)

        local opts = { noremap = true, silent = true }
        vim.keymap.set('n', key, cmd_string, opts)
    end


    vim.api.nvim_create_autocmd("FileType",
        { pattern = filetype, callback = format_string}
    )
end

map_filetype('*', '<Leader>rs', '$(head -1 % | cut -c 3-) %')

map_filetype('nroff', '<Leader>rr', 'man -P cat -l %')
map_filetype('markdown', '<Leader>rr', 'pandoc -t plain %')

map_filetype('python', '<Leader>rr', 'python3 %')
map_filetype('python', '<Leader>rt', 'pytest %')

map_filetype('go', '<Leader>rr', 'go run %')

map_filetype('rust', '<Leader>rr', 'cargo run')

map_filetype('c', '<Leader>rr', 'gcc -o "${TMPDIR}/a.out" % && "${TMPDIR}/a.out"')
map_filetype('cpp', '<Leader>rr', 'g++ -o "${TMPDIR}/a.out" % && "${TMPDIR}/a.out"')

map_filetype('asm', '<Leader>rr', 'as -o "${TMPDIR}/out.o" % && ld -o "${TMPDIR}/a.out" "${TMPDIR}/out.o" && "${TMPDIR}/a.out"')

map_filetype('make', '<Leader>rr', 'make -C "$(dirname "%")"')

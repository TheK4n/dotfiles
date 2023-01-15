if (packer_plugins["vim-rainbow"] and packer_plugins["vim-rainbow"].loaded) then
    return
end

vim.api.nvim_exec([[
    let g:rainbow_active = 1
]], true)

vim.api.nvim_create_autocmd('FileType',
             {
                 pattern = {"*"},
                 command = 'RainbowToggle'
             })

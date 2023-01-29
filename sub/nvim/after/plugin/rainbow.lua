if not (packer_plugins["vim-rainbow"] and packer_plugins["vim-rainbow"].loaded) then
    return
end

vim.api.nvim_create_autocmd('BufEnter',
             {
                 pattern = {"*"},
                 command = 'RainbowToggle'
             })

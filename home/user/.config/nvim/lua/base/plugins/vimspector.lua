return {
    'puremourning/vimspector',
    config = function()
        vim.cmd("let g:vimspector_base_dir='/home/thek4n/.local/share/nvim/lazy/vimspector'")
        vim.cmd("let g:vimspector_enable_mappings='HUMAN'")
        vim.cmd("let g:vimspector_configurations='/home/thek4n/.vimspector.json'")
    end
}

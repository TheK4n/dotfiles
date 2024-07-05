return {
    "j-morano/buffer_manager.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local map = vim.keymap.set
        map("n", "<leader><leader>", require("buffer_manager.ui").toggle_quick_menu, {desc = "Buffer manager"})
        vim.api.nvim_command([[
            autocmd FileType buffer_manager vnoremap <C-j> :m '>+1<CR>gv=gv
            autocmd FileType buffer_manager vnoremap <C-k> :m '<-2<CR>gv=gv
        ]])
    end
}
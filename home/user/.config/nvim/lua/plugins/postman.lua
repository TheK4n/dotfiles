return {
    "thek4n/postman.nvim",
    config = function()
        vim.keymap.set("n", "<Leader>rl", '<cmd>PostmanExec<CR>')
    end
}
return {
    "thek4n/mdimage.nvim",
    config = function()
        require("mdimage").setup({
            target_path = "./.img",
        })
    end
}
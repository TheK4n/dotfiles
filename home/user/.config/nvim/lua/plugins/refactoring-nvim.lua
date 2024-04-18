return {
	"ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("telescope").load_extension("refactoring")
    end,
	keys = {
        {
            "<space>rr",
            ":lua require('refactoring').select_refactor()<CR>",
            desc = "Select refactoring",
            mode = {"n", "x"},
        },
		-- Refactoring operations
		{
			"<space>re",
			"<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
			desc = "Extract Function",
			mode = "x",
		},
		{
			"<space>rf",
			"<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
			desc = "Extract Function To File",
			mode = "x",
		},
		{
			"<space>rv",
			"<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
			desc = "Extract Variable",
			mode = "x",
		},
		{
			"<space>rI",
			"<Esc><Cmd>lua require('refactoring').refactor('Inline Function')<CR>",
			desc = "Inline Function",
			mode = "n",
		},
		{
			"<space>ri",
			"<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
			desc = "Inline Variable",
			mode = {"n", "x"},
		},
		-- Extract block
		{
			"<space>rb",
			"<Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
			desc = "Extract Block",
			mode = "n",
		},
		{
			"<space>rbf",
			"<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
			desc = "Extract Block To File",
			mode = "n",
		},
        -- Telescope
        {
            "<leader>fr",
            "<Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
            mode = "n",
        }
	},
}
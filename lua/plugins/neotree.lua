return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	config = function()
		vim.keymap.set("n", "<Leader>k", ":Neotree filesystem toggle reveal left<CR>", {desc = "Toggle Neotree"})
	end,
}

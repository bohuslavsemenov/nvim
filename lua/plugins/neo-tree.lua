return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	opts = {
		filesystem = {
			visible = true,
			show_hidden_count = true,
			hide_dotfiles = false,
			hide_gitignored = true,
			hide_by_name = {
				".git",
				".DS_Store",
			},
			never_show = {},
		},
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				visible = true,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = {
					".git",
					".DS_Store",
				},
				never_show = {},
			},
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
	end,
}

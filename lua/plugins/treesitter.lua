return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true,
			ensure_installed = { "lua", "go", "vue", "typescript", "javascript", "json", "svelte", "html" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}

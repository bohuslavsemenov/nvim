return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			require("mason-lspconfig").setup({
				ensure_installed = { "ts_ls", "volar", "gopls", "lua_ls", "eslint", "svelte", "html" },
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({ capabilities = capabilities })
					end,
					ts_ls = function()
						lspconfig.ts_ls.setup({
							init_options = {
								plugins = {
									{
										name = "@vue/typescript-plugin",
										location = require("mason-registry")
											.get_package("vue-language-server")
											:get_install_path(),
										languages = { "vue" },
									},
								},
							},
						})
					end,
					volar = function()
						lspconfig.volar.setup({
							filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
							init_options = {
								vue = {
									hybridMode = false,
								},
							},
						})
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			vim.keymap.set("", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

return {
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				default_integrations = true,
				integrations = {
					mason = true,
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}

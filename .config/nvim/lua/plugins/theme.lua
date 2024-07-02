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
				custom_highlights = function(colors)
					return {
						FloatBorder = { fg = colors.blue, bg = colors.base },
					}
				end,
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}

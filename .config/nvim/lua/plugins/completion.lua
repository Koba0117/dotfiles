return {
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		"hrsh7th/cmp-path",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				formatting = {
					fields = { "kind", "abbr" },
					format = function(entry, vim_item)
						vim_item.menu = nil
						return vim_item
					end,
				},
				window = {
					documentation = cmp.config.window.bordered({
						-- winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
						border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
					}),
					completion = cmp.config.window.bordered({
						-- winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
						border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
					}),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					-- { name = "buffer" },
				}),
			})
		end,
	},
}

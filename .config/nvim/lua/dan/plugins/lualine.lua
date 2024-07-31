return {
	"nvim-lualine/lualine.nvim",

	dependencies = {
		"folke/trouble.nvim",
	},
	opts = function(_, opts)
		-- local trouble = require("trouble")
		-- local symbols = trouble.statusline({
		-- 	mode = "lsp_document_symbols",
		-- 	groups = {},
		-- 	title = false,
		-- 	filter = { range = true },
		-- 	format = "{kind_icon}{symbol.name:Normal}",
		-- 	hl_gropu = "lualine_c_normal"
		-- });
		--
		-- table.insert(opts.sections.lualine_c_normal, {
		-- 	symbols.get,
		-- 	cond = symbols.has,
		-- })
	end,
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
			},
		})
	end,
}

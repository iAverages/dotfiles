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
		buffers = {
			follow_currnet_file = {
				enable = true
			}
		},
		filesystem = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignore = false,
			hide_by_name = {
				"node_modules",
				".git",
				"target",
				"vendor",
			}
		}
	}
}

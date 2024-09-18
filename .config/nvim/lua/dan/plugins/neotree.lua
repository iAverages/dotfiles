return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    config = function()
        require("transparent").clear_prefix("NeoTree")
    end,
    opts = {
        buffers = {
            follow_currnet_file = {
                enable = true,
            },
        },
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignore = false,
                hide_by_name = {
                    "node_modules",
                    ".git",
                    "target",
                    "vendor",
                },
            },
        },
    },
}

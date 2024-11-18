return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim",
    },
    config = function()
        require("transparent").clear_prefix("NeoTree")
        require("neo-tree").setup({
            close_if_last_window = true,
            filesystem = {
                follow_current_file = {
                    enabled = true,
                },
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
        })
    end,
}

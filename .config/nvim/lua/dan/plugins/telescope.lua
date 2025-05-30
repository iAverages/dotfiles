local map = require("dan.helpers.keys").map

return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "folke/todo-comments.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            event = "VeryLazy",
            config = function()
                require("telescope").load_extension("ui-select")
            end,
        },
        {
            "nvim-telescope/telescope-ui-select.nvim",
            event = "VeryLazy",
        },
    },
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions")

        telescope.setup({
            pickers = {
                find_files = {
                    hidden = true,
                },
            },
            defaults = {
                file_ignore_patterns = {
                    "target", -- rust output
                    "node_modules", -- nodejs packages
                    "vendor", -- php packages
                    ".direnv", -- nix shit
                    ".git",
                },
                path_display = { "truncate" },
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                    },
                },
            },
            extensions = {
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    override_file_sorter = true,
                    case_mode = "smart_case",
                },
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        })

        telescope.load_extension("fzf")

        map("n", "<C-e>", "<cmd>Telescope find_files<cr>", "Fuzzy find files in cwd")
        map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", "Fuzzy find recent files")
        map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", "Find string in cwd")
        map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", "Find string under cursor in cwd")
        map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", "Find buffer")
        map("n", "<leader>ft", "<cmd>TodoTelescope<cr>", "Find todos")
        map("n", "<leader>fg", "<cmd>Telescope spell_suggest<cr>", "Find Correct Spelling")
    end,
}

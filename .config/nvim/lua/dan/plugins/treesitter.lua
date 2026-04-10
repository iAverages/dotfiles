return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "windwp/nvim-ts-autotag",
            "IndianBoy42/tree-sitter-just",
        },
        config = function()
            local treesitter = require("nvim-treesitter.configs")
            require("tree-sitter-just").setup({})

            treesitter.setup({
                highlight = {
                    enable = true,
                },
                indent = { enable = true },
                ensure_installed = {
                    "json",
                    "javascript",
                    "typescript",
                    "tsx",
                    "yaml",
                    "html",
                    "css",
                    "prisma",
                    "markdown",
                    "markdown_inline",
                    "bash",
                    "lua",
                    "vim",
                    "dockerfile",
                    "sql",
                    "gitignore",
                    "python",
                    "rust",
                    "go",
                    "php",
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        scope_incremental = false,
                        node_decremental = "<bs>",
                    },
                },

                -- default values to make lsp shut up
                modules = {},
                sync_install = false,
                auto_install = false,
                ignore_install = {},
                parser_install_dir = nil,
            })

            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,
                    enable_close_on_slash = true,
                    enable_rename = true,
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "VeryLazy",
        config = function()
            require("treesitter-context").setup({
                separator = "─",
                max_lines = 10,
            })
            vim.keymap.set("n", "[c", function()
                require("treesitter-context").go_to_context(vim.v.count1)
            end, { silent = true })
        end,
    },
}

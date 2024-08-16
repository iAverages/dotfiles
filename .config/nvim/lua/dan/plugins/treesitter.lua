return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "windwp/nvim-ts-autotag",
        },
        config = function()
            -- import nvim-treesitter plugin
            local treesitter = require("nvim-treesitter.configs")

            -- configure treesitter
            treesitter.setup({ -- enable syntax highlighting
                highlight = {
                    enable = true,
                },
                -- enable indentation
                indent = { enable = true },
                -- ensure these language parsers are installed
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
                    "java",
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
}

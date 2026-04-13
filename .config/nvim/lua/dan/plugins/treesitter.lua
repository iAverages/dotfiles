return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        branch = "main",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "windwp/nvim-ts-autotag",
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    -- Enable treesitter highlighting and disable regex syntax
                    pcall(vim.treesitter.start)
                    -- Enable treesitter-based indentation
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })

            local ensureInstalled = {
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
                "nix",
            }
            local alreadyInstalled = require("nvim-treesitter.config").get_installed()
            local parsersToInstall = vim.iter(ensureInstalled)
                :filter(function(parser)
                    return not vim.tbl_contains(alreadyInstalled, parser)
                end)
                :totable()
            require("nvim-treesitter").install(parsersToInstall)
        end,
        config = function()
            local treesitter = require("nvim-treesitter")
            treesitter.setup({
                highlight = {
                    enable = true,
                },
                indent = { enable = true },
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

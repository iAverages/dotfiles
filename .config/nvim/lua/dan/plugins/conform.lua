return {
{ 
        "stevearc/conform.nvim",
        lazy = false,
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true, lsp_fallback = true })
                end,
                mode = "",
                desc = "[F]ormat buffer",
            },
        },
        opts = {
            notify_on_error = true,
            format_on_save = function(bufnr)
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = { c = true, cpp = true }
                return {
                    timeout_ms = 500,
                    lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
                }
            end,
            formatters_by_ft = {
                lua = { "stylua" },
                rust = { "rustfmt" },
                javascript = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
                typescript = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
                javascriptreact = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
                json = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
                jsonc = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
                astro = { "oxfmt", "biome", "prettierd", "prettier", stop_after_first = true },
                sql = { "sleek" },
                nix = { "alejandra" },
            },
        },
    }
}

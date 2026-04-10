return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require("gitsigns").setup({
                current_line_blame = true,

                on_attach = function()
                    vim.cmd("Gitsigns toggle_current_line_blame")
                end
            })
            vim.keymap.set("n", "<leader>ghb", "<cmd>Gitsigns blame_line<cr>",
                { silent = true, desc = "Show git blame for entire line" })
            vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame<cr>",
                { silent = true, desc = "Show git blame for entire file" })
        end,
    },
}

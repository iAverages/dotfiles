-- Miscelaneous fun stuff
return {
    -- Comment with haste
    {
        "numToStr/Comment.nvim",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },

        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("Comment").setup({
                toggler = {
                    line = "<C-_>",
                },
                opleader = {
                    line = "<C-_>",
                },
                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
        end,
        lazy = false,
        opts = {
            toggler = {
                line = "<C-_>",
            },
            opleader = {
                line = "<C-_>",
            },
        },
    },
    -- Move stuff with <M-j> and <M-k> in both normal and visual mode
    {
        "echasnovski/mini.move",
        lazy = false,
    },
    -- Better buffer closing actions. Available via the buffers helper.
    {
        "kazhala/close-buffers.nvim",
        opts = {
            preserve_window_layout = { "this", "nameless" },
        },
    },
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    "tpope/vim-surround", -- Surround stuff with the ys-, cs-, ds- commands
}

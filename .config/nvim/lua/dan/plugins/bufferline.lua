return {
    {
        "akinsho/bufferline.nvim",
        lazy = false,
        keys = {
            { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
            { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
        },
        opts = {

            options = {
                diagnostics = "nvim_lsp",
                truncate_names = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        },
    },
}

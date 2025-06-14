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
                custom_filter = function(bufnr)
                    if vim.bo[bufnr].modified then
                        return true
                    end

                    if bufnr == vim.api.nvim_get_current_buf() then
                        return true
                    end

                    return false
                end,
            },
        },
    },
}

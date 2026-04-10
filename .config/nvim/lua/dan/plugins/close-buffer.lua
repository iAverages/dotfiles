return {
    "kazhala/close-buffers.nvim",
    opts = {
        preserve_window_layout = { "this", "nameless" },
    },
    config = function()
        vim.keymap.set("n", "<leader>q", function()
            -- close the current buffer
            require("close_buffers").delete({ type = "this" })
        end, { desc = "Close current buffer" })
    end,
}

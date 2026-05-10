return {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",
    keys = {
        { "<leader>gd", "<cmd>CodeDiff<cr>", desc = "open git diff" },
    },
    opts = {
        explorer = {
            initial_focus = "explorer",
        },
        keymaps = {
            view = {
                toggle_explorer = "<leader>e",
                focus_explorer = "<leader>E",
                next_hunk = "<C-n>",
                prev_hunk = "<C-p>",
                next_file = "]f",
                prev_file = "[f",
            },
        },
    },
}

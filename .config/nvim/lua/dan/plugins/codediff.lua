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
    },
}

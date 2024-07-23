local map = require("dan.helpers.keys").map

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "folke/todo-comments.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      pickers = {
        find_files = {
      hidden = true}},
      defaults = {
        path_display = { "truncate" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    telescope.load_extension("fzf")

    map("n", "<C-e>", "<cmd>Telescope find_files<cr>","Fuzzy find files in cwd")
    map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>",  "Fuzzy find recent files")
    map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>",  "Find string in cwd")
    map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", "Find string under cursor in cwd")
    map("n", "<leader>fb", "<cmd>Telescope buffers<cr>",  "Find buffer")
    map("n", "<leader>ft", "<cmd>TodoTelescope<cr>",  "Find todos")
    map("n", "<leader>fg", "<cmd>Telescope spell_suggest<cr>",  "Find Correct Spelling")

  end,
}



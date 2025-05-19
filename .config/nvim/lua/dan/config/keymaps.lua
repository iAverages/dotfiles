local map = require("dan.helpers.keys").map

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Split window
map("n", "ss", ":split<Return>", "Split window")
map("n", "sv", ":vsplit<Return>", "Split window vertically")
-- Move window
map("n", "<leader>h", "<C-w>h", "Move to left window")
map("n", "<leader>k", "<C-w>k", "Move to up window")
map("n", "<leader>j", "<C-w>j", "Move to down window")
map("n", "<leader>l", "<C-w>l", "Move to right window")

-- Center cursor when jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Cut without yanking
map("n", "x", '"_x', "Cut without yanking")

-- Toggle neo tree
map("n", "<leader>e", ":Neotree filesystem toggle<Return>", "Toggle file tree")

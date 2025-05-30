local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = true
opt.termguicolors = true
opt.clipboard:append("unnamedplus") -- use system clipboard as default register
vim.api.nvim_set_option("clipboard", "unnamed")
vim.cmd("set clipboard+=unnamedplus")

opt.scrolloff = 999

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.keymap.set("n", "<leader>i", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end)

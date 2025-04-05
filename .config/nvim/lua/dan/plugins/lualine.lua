return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = require("dan.config.lualine").theme(),
                icons_enabled = true,
                component_separators = "|",
                section_separators = "",
            },
            sections = {
                lualine_x = {
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                },
            },
            extensions = { "trouble" },
        })
    end,
}

return {
    {
        "nvim-mini/mini.nvim",
        version = false,
        -- dependencies = {
        --     'JoosepAlviste/nvim-ts-context-commentstring',
        -- },
        config = function()
            require("mini.pairs").setup()
            -- TODO: see if i can move to this
            -- require("mini.comment").setup({
            --     options = {
            --         custom_commentstring = function()
            --             return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo
            --                 .commentstring
            --         end,
            --     },
            --     mappings = {
            --         comment = "<C-_>",
            --     }
            -- })
            require("mini.move").setup()
            require("mini.surround").setup()
            require("mini.indentscope").setup({
                draw = {
                    delay = 25,
                    animation = function(s, n) return 10 end,
                }
            })
            require("mini.basics").setup({
                mapings = {
                    basic = false,
                },
            })

            require("mini.hipatterns").setup({
                highlighters = {
                    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
                    todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
                    note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

                    hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
                },
            })
        end,
    },
}

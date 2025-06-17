-- Miscelaneous fun stuff
return {
    {
        "iAverages/auto-buffer-close.nvim",
        opts = {},
    },
    -- Comment with haste
    {
        "numToStr/Comment.nvim",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },

        config = function()
            ---@diagnostic disable: missing-fields
            require("Comment").setup({
                toggler = {
                    line = "<C-_>",
                },
                opleader = {
                    line = "<C-_>",
                },

                pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            })
            ---@diagnostic enable: missing-fields
        end,
        lazy = false,
        opts = {
            toggler = {
                line = "<C-_>",
            },
            opleader = {
                line = "<C-_>",
            },
        },
    },
    -- Move stuff with <M-j> and <M-k> in both normal and visual mode
    {
        "echasnovski/mini.move",
        lazy = false,
        version = false,
        config = function()
            require("mini.move").setup()
        end,
    },
    {
        "echasnovski/mini.pairs",
        version = false,
        event = "VeryLazy",
        config = function()
            require("mini.pairs").setup()
        end,
    },
    -- Better buffer closing actions. Available via the buffers helper.
    {
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
    },

    {
        "echasnovski/mini.hipatterns",
        event = "BufReadPre",
        config = function()
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

    {
        "echasnovski/mini.surround",
        version = false,
        event = "VeryLazy",
        config = function()
            require("mini.surround").setup()
        end,
    },

    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    "wuelnerdotexe/vim-astro",
    {
        "ojroques/nvim-osc52",
        config = function()
            require("osc52").setup({
                silent = true,
                trim = false,
            })

            vim.api.nvim_set_keymap("v", "<leader>y", '<cmd>lua require("osc52").copy_visual()<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>y", '<cmd>lua require("osc52").copy_operator()<CR>', { noremap = true, silent = true })
            vim.api.nvim_set_keymap("n", "<leader>yy", '<cmd>lua require("osc52").copy_line()<CR>', { noremap = true, silent = true })
        end,
    },
}

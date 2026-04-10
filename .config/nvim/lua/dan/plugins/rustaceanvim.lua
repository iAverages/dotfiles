return {
    {
        "mrcjkb/rustaceanvim",
        version = "^9",
        init = function()
            vim.g.rustaceanvim = {
                server = {
                    default_settings = {
                        ["rust-analyzer"] = {
                            imports = {
                                granularity = {
                                    group = "module",
                                },
                                prefix = "self",
                            },
                            cargo = {
                                buildScripts = {
                                    enable = true,
                                },
                            },
                            procMacro = {
                                enable = true,
                            },
                        },
                    },
                },
            }
        end,
        lazy = false,
    }
}

return {
    "neovim/nvim-lspconfig",
    config = function()
        -- configs provided by lspconfig
        vim.lsp.enable("biome")
        vim.lsp.enable("oxlint")
        vim.lsp.enable("dockerls")
        vim.lsp.enable("html")
        vim.lsp.enable("cssls")
        vim.lsp.enable("bashls")
        vim.lsp.enable("tailwindcss")
        -- vim.lsp.enable("rust_analyze

        -- custom configs / setting changes
        vim.lsp.config["luals"] = {
            cmd = { "lua-language-server" },
            filetypes = { "lua" },
            root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false,
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        }
        vim.lsp.enable("luals")

        vim.lsp.config("terraformls", {
            cmd = { "terraform-ls", "serve" },
            filetypes = { "terraform", "terraform-vars", "hcl" },
            root_markers = { ".terraform", ".git", "main.tf", "terragrunt.hcl" },
            init_options = {
                experimentalFeatures = {
                    validateOnSave = true,
                    prefillRequiredFields = true,
                },
                validation = {
                    enableEnhancedValidation = true,
                },
            },
        })
        vim.lsp.enable("terraformls")

        vim.lsp.config["gopls"] = {
            settings = {
                gopls = {
                    hints = {
                        rangeVariableTypes = true,
                        parameterNames = true,
                        constantValues = true,
                        assignVariablesTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        functionTypeParameters = true,
                    },
                    completeUnimported = true,
                    usePlaceholders = true,
                    analyses = {
                        unusedparams = true,
                    },
                },
            },
        }
        vim.lsp.enable("gopls")

        vim.lsp.config["yamlls"] = {
            cmd = { "yaml-language-server", "--stdio" },
            filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values" },
            root_markers = { ".git" },
            settings = {
                redhat = {
                    telemetry = {
                        enabled = false,
                    },
                },
                yaml = {
                    format = {
                        enable = true,
                    },
                    schemaStore = {
                        enable = true,
                        url = "https://www.schemastore.org/api/json/catalog.json",
                    },
                    schemas = {
                        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                    },
                },
            },
        }
        vim.lsp.enable("yamlls")

        vim.lsp.config["tsserver"] = {
            cmd = { "tsgo", "--lsp", "--stdio" },
            filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
            settings = {
                typescript = {
                    inlayHints = {
                        -- taken from https://github.com/typescript-language-server/typescript-language-server#workspacedidchangeconfiguration
                        includeInlayEnumMemberValueHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                    },
                },
                javascript = {
                    inlayHints = {
                        includeInlayEnumMemberValueHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                    },
                },
            },
        }
        vim.lsp.enable("tsserver")

        local hostname = vim.fn.hostname()
        local username = vim.env.USER
        local flake_path = string.format("/home/%s/opensource/nixdots", username)

        vim.lsp.config["nixd"] = {
            cmd = { "nixd" },
            filetypes = { "nix" },
            root_markers = { "flake.nix", "flake.lock", ".git" },
            settings = {
                nixd = {
                    autowatch = true,
                    nixpkgs = {
                        expr = string.format('import (builtins.getFlake "%s").inputs.nixpkgs.outPath { }', flake_path),
                    },
                    formatting = {
                        command = { "nixfmt" },
                    },
                    options = {
                        nixos = {
                            expr = string.format('(builtins.getFlake "%s").nixosConfigurations.%s.options', flake_path,
                                hostname),
                        },
                        home_manager = {
                            expr = string.format('(builtins.getFlake "%s").homeConfigurations."%s".options', flake_path,
                                username),
                        },
                        flake_parts = {
                            expr = string.format('(builtins.getFlake "%s").debug.options', flake_path),
                        },
                    },
                },
            },
        }
        vim.lsp.enable("nixd")

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then
                    return
                end

                if client:supports_method("textDocument/inlayHint") then
                    vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
                end

                local keymap = vim.keymap
                local opts = { buffer = args.buf }

                opts.desc = "Show LSP references"
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "Go to declaration"
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Show LSP definitions"
                keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "Show LSP implementations"
                keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "Show LSP type definitions"
                keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                opts.desc = "See available code actions"
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts.desc = "Smart rename"
                keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts.desc = "Show buffer diagnostics"
                keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                opts.desc = "Show line diagnostics"
                keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Go to previous diagnostic"
                keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)

                opts.desc = "Go to next diagnostic"
                keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)

                opts.desc = "Show documentation for what is under cursor"
                keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Restart LSP"
                keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

                opts.desc = "Show signature help for what is under cursor"
                vim.keymap.set("n", "<C-k>", function()
                    vim.lsp.buf.signature_help({ border = "rounded" })
                end, opts)
            end,
        })

        vim.diagnostic.config({
            float = { border = "rounded" },
            virtual_lines = false,
            virtual_text = {
                prefix = "●",
            },
            signs = true,
            underline = true,
            update_in_insert = false,
        })
    end
}

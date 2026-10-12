return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "Hoffs/omnisharp-extended-lsp.nvim" },
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
                opts = opts or {}
                opts.border = opts.border or "single"
                opts.max_width = opts.max_width or 80
                return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            vim.diagnostic.config({
                virtual_text = {
                    prefix = " ●",
                },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "󰅚 ",
                        [vim.diagnostic.severity.WARN] = "󰀪 ",
                        [vim.diagnostic.severity.INFO] = "󰋽 ",
                        [vim.diagnostic.severity.HINT] = "󰌶 ",
                    },
                },
            })

            vim.keymap.set("n", "gn", function()
                vim.diagnostic.jump({ count = 1, float = true })
            end)
            vim.keymap.set("n", "gN", function()
                vim.diagnostic.jump({ count = -1, float = true })
            end)
            vim.keymap.set("n", "gC", vim.diagnostic.open_float)
            vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, { desc = "Set LOC list" })

            local on_attach = function(_, bufnr)
                local map = function(keys, func, desc)
                    vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
                end

                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                map("gd", function()
                    require("omnisharp_extended").telescope_lsp_definition()
                end, "[G]oto [D]efinition")
                map("gi", function()
                    require("omnisharp_extended").telescope_lsp_implementation({ excludeDefinition = true })
                end, "[G]oto [I]mplementation")
                map("<leader>D", function()
                    require("omnisharp_extended").telescope_lsp_type_definition()
                end, "Type [D]efinition")
                map("gr", function()
                    require("omnisharp_extended").telescope_lsp_references({ excludeDefinition = true })
                end, "[G]oto [R]eferences")
                map("gh", vim.lsp.buf.hover, "Hover Documentation")
                map("gH", vim.lsp.buf.signature_help, "Signature help")
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                map("==", function()
                    vim.lsp.buf.format({ async = true })
                end, "Format code")
            end

            vim.lsp.config["lua_ls"] = {
                on_attach = on_attach,
                settings = {
                    Lua = {
                        completion = {
                            keywordSnippet = "Disable",
                        },
                        diagnostics = {
                            globals = { "use", "vim" },
                            disable = { "lowercase-global" },
                        },
                        runtime = {
                            version = "LuaJIT",
                            path = vim.split(package.path, ";"),
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                            },
                        },
                    },
                },
            }
            vim.lsp.enable("lua_ls")

            vim.lsp.config["ts_ls"] = {
                on_attach = function(_, bufnr)
                    -- Enable LSP-based keymaps
                    local opts = { noremap = true, silent = true, buffer = bufnr }

                    vim.keymap.set("n", "gd", function()
                        require("telescope.builtin").lsp_definitions()
                    end, opts)
                    vim.keymap.set("n", "gr", function()
                        require("telescope.builtin").lsp_references()
                    end, opts)
                    vim.keymap.set("n", "gi", function()
                        require("telescope.builtin").lsp_implementations()
                    end, opts)
                    vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                end,
                settings = {
                    typescript = {
                        preferences = {
                            includePackageJsonAutoImports = "on",
                        },
                    },
                    javascript = {
                        preferences = {
                            includePackageJsonAutoImports = "on",
                        },
                    },
                },
            }
            vim.lsp.enable("ts_ls")

            vim.lsp.enable("eslint")

            vim.lsp.config["omnisharp"] = {
                on_attach = on_attach,
                handlers = {
                    ["textDocument/definition"] = require("omnisharp_extended").handler,
                    ["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
                    ["textDocument/references"] = require("omnisharp_extended").references_handler,
                    ["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
                },
                cmd = {
                    "omnisharp",
                    "--languageserver",
                    "--hostPID",
                    tostring(vim.fn.getpid()),
                },
                settings = {
                    FormattingOptions = {
                        EnableEditorConfigSupport = true,
                        OrganizeImports = true,
                    },
                    MsBuild = {
                        LoadProjectsOnDemand = nil,
                    },
                    RoslynExtensionsOptions = {
                        EnableAnalyzersSupport = nil,
                        EnableImportCompletion = nil,
                        AnalyzeOpenDocumentsOnly = nil,
                    },
                    Sdk = {
                        IncludePrereleases = true,
                    },
                },
            }
            vim.lsp.enable("omnisharp")
        end,
    },
}

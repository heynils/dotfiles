return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "Hoffs/omnisharp-extended-lsp.nvim" },
        config = function()
            local lsp_config = require("lspconfig")

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
                map("<F1>", vim.lsp.buf.hover, "Hover Documentation")
                map("gH", vim.lsp.buf.signature_help, "Signature help")
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                map("==", function()
                    vim.lsp.buf.format({ async = true })
                end, "Format code")
            end

            lsp_config.lua_ls.setup({
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
            })

            local builtin = require("telescope.builtin")
            lsp_config.ts_ls.setup({
                on_attach = function(_, bufnr)
                    -- Enable LSP-based keymaps
                    local opts = { noremap = true, silent = true, buffer = bufnr }

                    vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
                    vim.keymap.set("n", "gr", builtin.lsp_references, opts)
                    vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
                    vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                end,
            })
            lsp_config.html.setup({ on_attach = on_attach })
            lsp_config.cssls.setup({ on_attach = on_attach })
            -- lsp_config.tailwindcss.setup({ on_attach = on_attach })
            -- local bicep_lsp_bin = "/usr/local/bin/bicep-langserver/Bicep.LangServer.dll"
            -- lsp_config.bicep.setup({
            --     cmd = { "dotnet", bicep_lsp_bin },
            --     on_attach = on_attach,
            --     filetypes = { "bicep" },
            --     root_dir = lsp_config.util.root_pattern(".git", "."),
            --     single_file_support = true,
            -- })

            lsp_config.omnisharp.setup({
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
                        -- Enables support for reading code style, naming convention and analyzer
                        -- settings from .editorconfig.
                        EnableEditorConfigSupport = true,
                        -- Specifies whether 'using' directives should be grouped and sorted during
                        -- document formatting.
                        OrganizeImports = true,
                    },
                    MsBuild = {
                        -- If true, MSBuild project system will only load projects for files that
                        -- were opened in the editor. This setting is useful for big C# codebases
                        -- and allows for faster initialization of code navigation features only
                        -- for projects that are relevant to code that is being edited. With this
                        -- setting enabled OmniSharp may load fewer projects and may thus display
                        -- incomplete reference lists for symbols.
                        LoadProjectsOnDemand = nil,
                    },
                    RoslynExtensionsOptions = {
                        -- Enables support for roslyn analyzers, code fixes and rulesets.
                        EnableAnalyzersSupport = nil,
                        -- Enables support for showing unimported types and unimported extension
                        -- methods in completion lists. When committed, the appropriate using
                        -- directive will be added at the top of the current file. This option can
                        -- have a negative impact on initial completion responsiveness,
                        -- particularly for the first few completion sessions after opening a
                        -- solution.
                        EnableImportCompletion = nil,
                        -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                        -- true
                        AnalyzeOpenDocumentsOnly = nil,
                    },
                    Sdk = {
                        -- Specifies whether to include preview versions of the .NET SDK when
                        -- determining which version to use for project loading.
                        IncludePrereleases = true,
                    },
                },
            })
        end,
    },
}

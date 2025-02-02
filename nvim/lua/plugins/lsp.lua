return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "Hoffs/omnisharp-extended-lsp.nvim" },
        config = function()
            local lsp_config = require("lspconfig")

            local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
            function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
              opts = opts or {}
              opts.border = opts.border or 'single'
              opts.max_width= opts.max_width or 80
              return orig_util_open_floating_preview(contents, syntax, opts, ...)
            end

            vim.diagnostic.config({
                virtual_text = {
                    prefix = " ●"
                },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = "󰅚 ",
                        [vim.diagnostic.severity.WARN] = "󰀪 ",
                        [vim.diagnostic.severity.INFO] = "󰋽 ",
                        [vim.diagnostic.severity.HINT] = "󰌶 ",
                    },
                }
            })

            vim.keymap.set("n", "gn", vim.diagnostic.goto_next)
            vim.keymap.set("n", "gN", vim.diagnostic.goto_prev)
            vim.keymap.set("n", "gC", vim.diagnostic.open_float)
            vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, { desc = "Set LOC list" })

            local on_attach = function(_, bufnr)
                local map = function(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
                end

                map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
                map("gd", function()
                    -- require('omnisharp_extended').telescope_lsp_definition({ jump_type = "vsplit" })
                    require('omnisharp_extended').telescope_lsp_definition()
                end, "[G]oto [D]efinition")
                map("gi", function()
                    require('omnisharp_extended').telescope_lsp_implementation()
                end, "[G]oto [I]mplementation")
                map("<leader>D", function()
                    require('omnisharp_extended').telescope_lsp_type_definition()
                end, "Type [D]efinition")
                map("gr", function()
                    require('omnisharp_extended').telescope_lsp_references({ excludeDefinition = true })
                end, "[G]oto [R]eferences")
                map("gh", vim.lsp.buf.hover, "Hover Documentation")
                -- map("<C-s>", vim.lsp.buf.signature_help, "Signature help")
                map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
                map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                map("==", function() vim.lsp.buf.format { async = true } end, "Format code")
            end

            lsp_config.lua_ls.setup {
                on_attach = on_attach,
                settings = {
                    Lua = {
                        completion = {
                            keywordSnippet = "Disable",
                        },
                        diagnostics = {
                            globals = { "use", "vim" },
                            disable = { "lowercase-global" }
                        },
                        runtime = {
                            version = "LuaJIT",
                            path = vim.split(package.path, ";")
                        },
                        workspace = {
                            library = {
                                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                            }
                        }
                    }
                }
            }

            lsp_config.pyright.setup { on_attach = on_attach }
            lsp_config.ts_ls.setup { on_attach = on_attach }
            lsp_config.html.setup { on_attach = on_attach }
            lsp_config.cssls.setup { on_attach = on_attach }

            lsp_config.omnisharp.setup {
                handlers = {
                    ["textDocument/definition"] = require('omnisharp_extended').handler,
                },
                cmd = {
                    "omnisharp",
                    "--languageserver",
                    "--hostPID",
                    tostring(vim.fn.getpid())
                },
                on_attach = on_attach
            }
        end
    },

}

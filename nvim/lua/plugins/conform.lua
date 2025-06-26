return {
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    json = { "jq" },
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
                    typescript = { "prettierd", "prettier", stop_after_first = true },
                    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
                    -- cs = { "csharpier" },
                    lua = { "stylua" },
                    css = { "prettier" },
                    yaml = { "prettier" },
                    bicep = { "bicep" },
                },

                format_on_save = {
                    -- These options will be passed to conform.format()
                    timeout_ms = 500,
                    lsp_fallback = false,
                },
                formatters = {
                    stylua = {
                        command = "stylua",
                        args = { "--indent-type", "Spaces", "--indent-width", "4", "-" },
                        stdin = true,
                    },
                    csharpier = {
                        command = "/Users/heynils/.dotnet/tools/csharpier",
                        args = { "format" },
                        stdin = true,
                    },
                    bicep = {
                        command = "bicep",
                        args = { "format", "--stdout" },
                        stdin = true,
                    },
                },
            })
        end,
    },
}

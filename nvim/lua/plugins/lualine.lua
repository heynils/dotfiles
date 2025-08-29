return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },

        config = function()
            require("lualine").setup({
                options = {
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "windows" },
                    lualine_x = {
                        {
                            function()
                                local clients = vim.lsp.get_clients()
                                local parts = {}

                                for _, client in pairs(clients) do
                                    table.insert(parts, " " .. client.name)
                                end

                                return table.concat(parts, " ")
                            end,
                        },
                        "encoding",
                        "filetype",
                    },
                },
            })
        end,
    },
}

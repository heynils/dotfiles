return {
    {
        "nvim-tree/nvim-tree.lua",
        keys = {
            { "<leader>t", "<CMD>NvimTreeToggle<CR>",   desc = "NvimTree Toggle" },
            { "<leader>T", "<CMD>NvimTreeFindFile<CR>", desc = "NvimTree Find File" },
        },
        config = function()
            require("nvim-tree").setup {
                sync_root_with_cwd = true,
                renderer = {
                    special_files = {
                        "Cargo.toml",
                        "Containerfile",
                        "Dockerfile",
                        "Makefile",
                        "README.md",
                        "readme.md"
                    },
                },
                filters = {
                    custom = {
                        "^.git$",
                        "bin",
                        "obj"
                    },
                    dotfiles = false,
                },
                view = {
                    signcolumn = "no"
                }
            }
        end
    },

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        config = function()
            require("nvim-web-devicons").setup {
                override_by_extension = {
                    ["csproj"] = {
                        name = "CSProj",
                        icon = "",
                        color = "#017bcd"
                    },
                    ["rs"] = {
                        name = "Rust",
                        icon = "",
                        color = "#f74c00"
                    }
                }
            }
        end
    },
}

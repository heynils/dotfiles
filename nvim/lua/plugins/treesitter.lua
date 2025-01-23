return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    "bash",
                    "c",
                    "comment",
                    "c_sharp",
                    "css",
                    "csv",
                    "dockerfile",
                    "gitattributes",
                    "gitcommit",
                    "git_config",
                    "gitignore",
                    "git_rebase",
                    "helm",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "make",
                    "markdown_inline",
                    "proto",
                    "python",
                    "query",
                    "regex",
                    "scss",
                    "sql",
                    "toml",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "yaml"
                },
                sync_install = false,
                ignore_install = {},
                highlight = {
                    enable = true,
                    disable = {},
                    additional_vim_regex_highlighting = false
                },
                indent = {
                    enable = true
                }
            }
        end,
        cmd = "TSUpdate"
    }
}

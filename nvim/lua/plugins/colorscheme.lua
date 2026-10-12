return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent_background = true,
            -- detecting installed plugins costs ~10ms on every startup
            auto_integrations = false,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
            integrations = {
                cmp = true,
                gitsigns = true,
                illuminate = { enabled = true, lsp = false },
                indent_blankline = { enabled = true },
                lsp_trouble = true,
                mason = true,
                noice = true,
                nvim_surround = true,
                telescope = true,
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd("highlight clear LineNr")
            vim.cmd("highlight clear SignColumn")
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}

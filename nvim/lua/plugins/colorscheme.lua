return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent_background = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
            integrations = {
                cmp = true,
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd("highlight clear LineNr")
            vim.cmd("highlight clear SignColumn")
            vim.cmd.colorscheme("catppuccin")
        end,
    }
}

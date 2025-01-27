return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd.colorscheme("catppuccin")
            vim.cmd("highlight clear LineNr")
            vim.cmd("highlight clear SignColumn")
            -- vim.cmd("highlight LineNr guifg=#808080")

        end,
    }
}

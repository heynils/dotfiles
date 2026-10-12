return {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    opts = { easing = "quintic" },
    config = function(_, opts)
        require("neoscroll").setup(opts)
    end,
}

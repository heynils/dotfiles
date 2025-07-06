return {
    "karb94/neoscroll.nvim",
    opts = { easing = "quintic" },
    config = function(_, opts)
        require("neoscroll").setup(opts)
    end,
}

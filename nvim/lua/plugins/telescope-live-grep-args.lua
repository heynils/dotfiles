return {
    "nvim-telescope/telescope-live-grep-args.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("telescope").load_extension("live_grep_args")
    end,

    vim.keymap.set("n", "<leader>fa", function()
        require("telescope").extensions.live_grep_args.live_grep_args()
    end, { desc = "Live Grep with Args" }),
}

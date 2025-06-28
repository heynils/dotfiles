return {
    "vim-test/vim-test",
    keys = {
        { "<leader>tt", ":TestNearest<CR>", desc = "Run nearest test" },
        { "<leader>tf", ":TestFile<CR>", desc = "Run test file" },
        { "<leader>ta", ":TestSuite<CR>", desc = "Run entire suite" },
        { "<leader>tl", ":TestLast<CR>", desc = "Run last test" },
    },
    init = function()
        vim.g["test#strategy"] = "neovim"
    end,
}

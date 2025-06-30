return {
    "vim-test/vim-test",
    keys = {
        { "<leader>Tt", ":TestNearest<CR>", desc = "Run nearest test" },
        { "<leader>Tf", ":TestFile<CR>", desc = "Run test file" },
        { "<leader>Ta", ":TestSuite<CR>", desc = "Run entire suite" },
        { "<leader>Tl", ":TestLast<CR>", desc = "Run last test" },
    },
    init = function()
        vim.g["test#strategy"] = "neovim"
    end,
}

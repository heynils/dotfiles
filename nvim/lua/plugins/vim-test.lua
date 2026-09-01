return {
    "vim-test/vim-test",
    dependencies = {
        "preservim/vimux",
    },
    keys = {
        { "<leader>t", ":TestNearest<CR>", desc = "Run nearest test" },
        { "<leader>T", ":TestFile<CR>", desc = "Run test file" },
        { "<leader>Ta", ":TestSuite<CR>", desc = "Run entire suite" },
        { "<leader>Tl", ":TestLast<CR>", desc = "Run last test" },
    },
    init = function()
        vim.g["test#strategy"] = "vimux"
    end,
}

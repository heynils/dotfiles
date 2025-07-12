return {
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup({
                handlers = {
                    cursor = false,
                    diagnostic = true,
                    handle = true,
                    gitsigns = true,
                },
            })
        end,
        lazy = false,
    },
}

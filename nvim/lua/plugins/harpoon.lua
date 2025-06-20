return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("harpoon").setup({
                settings = {
                    save_on_toggle = true,
                    save_on_change = true,
                    mark_branch = false,

                    -- Use a static key to make Harpoon global (not per-directory)
                    key = function()
                        return "global"
                    end,
                },
            })
        end,
    }
}

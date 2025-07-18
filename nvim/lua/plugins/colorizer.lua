return {
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                user_default_options = {
                    names = true,
                    names_filter = function(name)
                        return name:lower() ~= "azure"
                    end,
                },
            })
        end,
    },
}

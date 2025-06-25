return {
    "cbochs/grapple.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true }
    },
    lazy = true,
    opts = {
        scope = "git",
    },
    cmd = "Grapple",
    keys = {
        { "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
        { "<leader>H", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
        { "<TAB>", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
        { "<S-TAB>", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
    },
}

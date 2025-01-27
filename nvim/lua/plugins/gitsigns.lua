return {
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup {
                signs = {
                    add          = { text = '┃' },
                    change       = { text = '┃' },
                    delete       = { text = '┃' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    -- Normal mode
                    vim.keymap.set("n", "<space>hb", function() gs.blame_line { full = true } end,
                        { desc = "[H]istory [B]lame", buffer = bufnr })
                    vim.keymap.set('n', '<space>ht', gs.toggle_current_line_blame,
                        { desc = "[H]istory [T]oggle blame", buffer = bufnr })

                    vim.keymap.set('n', '<leader>hp', gs.preview_hunk)
                    vim.keymap.set('n', '<leader>hr', gs.reset_hunk)
                    vim.keymap.set('n', '<leader>hs', gs.stage_hunk)
                    vim.keymap.set('n', '<leader>hd', gs.diffthis)

                    -- Visual mode
                    vim.keymap.set('v', '<leader>hr', function()
                              gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                    end)
                    vim.keymap.set('v', '<leader>hs', function()
                          gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
                        end)
                end
            }
            require("scrollbar.handlers.gitsigns").setup()
        end
    }
}

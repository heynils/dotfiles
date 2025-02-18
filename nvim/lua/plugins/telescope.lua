return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-ui-select.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make"
            }
        },
        config = function()
            local actions = require('telescope.actions')
            require('telescope').setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,
                            ["<Tab>"] = actions.move_selection_next,
                            ["<S-Tab>"] = actions.move_selection_previous,
                        },
                    },
                    prompt_prefix = "🔍 ",
                    -- selection_caret = "🡪 ",
                },

            })

            local telescope = require("telescope")

            telescope.setup {
                defaults = {
                    file_ignore_patterns = {
                        "%.git/",
                        "node_modules/",
                        "bin/",
                        "obj/",
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                },
                pickers = {
                    find_files = {
                        hidden = true,
                        theme = "ivy",
                    },
                    live_grep = {
                        additional_args = function(_) return { "--hidden" } end,
                        theme = "ivy",
                    },
                    buffers = {
                        theme = "ivy",
                    },
                    lsp_references = {
                        show_line = false,
                        theme = "ivy",
                    },
                    diagnostics = {
                        theme = "ivy",
                    },
                    current_buffer_fuzzy_find = {
                        theme = "ivy",
                    }
                }
            }

            telescope.load_extension("ui-select")
            telescope.load_extension("fzf")

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>f", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "Live grep" })
            vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "List open buffers" })
            -- vim.keymap.set("n", "<leader>s", builtin.treesitter, { desc = "Treesiter symbols" })
            vim.keymap.set("n", "<leader>dd", builtin.diagnostics, { desc = "List diagnostics" })
            vim.keymap.set("n", "<leader>rp", builtin.resume, { desc = "[R]esume [p]icker" })
            vim.keymap.set("n", "<leader>en", function()
                builtin.find_files {
                    cwd = vim.fn.stdpath('config')
                }
            end)
            vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Search current buffer" })

            vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#2a2b3c", fg = "#cdd6f4" })
            vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "#2a2b3c", fg = "#ffa500" })
        end
    }
}

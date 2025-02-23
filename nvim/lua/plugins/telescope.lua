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
                            ["<C-j>"] = actions.move_selection_next,
                            ["<S-Tab>"] = actions.move_selection_previous,
                            ["<C-k>"] = actions.move_selection_previous,
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
                        "env/",
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
                    oldfiles = {
                        theme = "ivy",
                    },
                    buffers = {
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
            vim.keymap.set("n", "<leader>F", builtin.find_files, { desc = "Find files in cwd" })
            vim.keymap.set("n", "<leader>G", builtin.live_grep, { desc = "Live grep in starting directory" })
            vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "List open buffers" })
            vim.keymap.set("n", "<leader>dd", builtin.diagnostics, { desc = "List diagnostics" })
            vim.keymap.set("n", "<leader>rp", builtin.resume, { desc = "[R]esume [p]icker" })
            vim.keymap.set("n", "<leader>en", function()
                builtin.find_files {
                    cwd = vim.fn.stdpath('config')
                }
            end)
            vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Search current buffer" })
            vim.keymap.set("n", "<leader>of", builtin.oldfiles, { desc = "[O]ld [F]iles" })

            -- Grep in the root of the Git repo based on current buffer
            vim.keymap.set('n', '<leader>g', function()
                -- Get the directory of the current file
                local current_file = vim.api.nvim_buf_get_name(0)
                local current_dir = vim.fn.fnamemodify(current_file, ':h')

                -- Find the Git root from the current file's directory
                local git_root = vim.fn.systemlist("git -C " ..
                    vim.fn.shellescape(current_dir) .. " rev-parse --show-toplevel")[1]

                if vim.v.shell_error == 0 then
                    builtin.live_grep({ search_dirs = { git_root } })
                else
                    builtin.live_grep()
                end
            end, { noremap = true, silent = true })

            -- Find files in the root of the Git repo based on current buffer
            vim.keymap.set('n', '<leader>f', function()
                -- Get the directory of the current file
                local current_file = vim.api.nvim_buf_get_name(0)
                local current_dir = vim.fn.fnamemodify(current_file, ':h')

                -- Find the Git root for that directory
                local git_root = vim.fn.systemlist("git -C " ..
                vim.fn.shellescape(current_dir) .. " rev-parse --show-toplevel")[1]

                if vim.v.shell_error == 0 then
                    -- Search for files starting from the Git root
                    builtin.find_files({ cwd = git_root })
                else
                    builtin.find_files()
                end
            end, { noremap = true, silent = true })

            vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#2a2b3c", fg = "#cdd6f4" })
            vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "#2a2b3c", fg = "#ffa500" })
        end
    }
}

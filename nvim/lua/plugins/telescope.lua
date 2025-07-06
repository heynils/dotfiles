return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-ui-select.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup({
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
                    sorting_strategy = "ascending",
                    prompt_prefix = "🔍 ",
                    layout_config = {
                        height = 0.7,
                        prompt_position = "top",
                    },
                    -- Format path as "file.txt (path\to\file\)"

                    path_display = function(_, path)
                        local tail = require("telescope.utils").path_tail(path)

                        local home = vim.loop.os_homedir()
                        if path:sub(1, #home) == home then
                            path = "~" .. path:sub(#home + 1)
                        end

                        local display = string.format("%s %s", tail, path)

                        -- Highlight the path portion (after " - ")
                        local tail_len = #tail
                        local sep_len = 1
                        local path_start = tail_len + sep_len
                        local path_end = #display

                        return display, { { { path_start, path_end }, "TelescopePathItalic" } }
                    end,
                    preview = { hide_one_startup = false },
                },
            })

            local telescope = require("telescope")

            telescope.setup({
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
                        require("telescope.themes").get_dropdown({}),
                    },
                    live_grep_args = {
                        auto_quoting = false, -- enable/disable auto-quoting
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                    },
                    live_grep = {
                        additional_args = function(_)
                            return { "--hidden" }
                        end,
                    },
                    lsp_references = {
                        path_display = { "smart" },
                        show_line = true,
                    },
                    resume_picker = {
                        path_display = { "tail" },
                    },
                },
            })

            telescope.load_extension("ui-select")
            telescope.load_extension("fzf")

            require("neoclip").setup({
                enable_persistent_history = true,
                keys = {
                    telescope = {
                        i = {
                            paste = "<CR>",
                        },
                        n = {
                            paste = "<CR>",
                        },
                    },
                },
            })

            telescope.load_extension("neoclip")

            vim.keymap.set("n", "<leader>p", function()
                require("telescope").extensions.neoclip.default()
            end, { desc = "Open Neoclip with Telescope" })

            local builtin = require("telescope.builtin")
            local git_folder = vim.fn.expand("~/git/")
            vim.keymap.set("n", "<leader>F", function()
                builtin.find_files({ cwd = git_folder, prompt_title = "Files in all repos" })
            end)
            vim.keymap.set("n", "<leader>G", function()
                builtin.live_grep({ cwd = git_folder, prompt_title = "Search in all repos" })
            end)
            vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "List open buffers" })
            vim.keymap.set("n", "<leader>dd", builtin.diagnostics, { desc = "List diagnostics" })
            vim.keymap.set("n", "<leader>rp", builtin.resume, { desc = "[R]esume [p]icker" })
            vim.keymap.set("n", "<leader>s", builtin.lsp_document_symbols, { desc = "LSP document [S]ymbols" })
            vim.keymap.set("n", "<leader>en", function()
                builtin.find_files({
                    cwd = vim.fn.stdpath("config"),
                    prompt_title = "Files in Neovim config",
                })
            end)
            vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "Search current buffer" })
            vim.keymap.set("n", "<leader>o", builtin.oldfiles, { desc = "[O]ld [F]iles" })

            -- Grep in the root of the Git repo based on current buffer
            vim.keymap.set("n", "<leader>g", function()
                -- Get the directory of the current file
                local current_file = vim.api.nvim_buf_get_name(0)
                local current_dir = vim.fn.fnamemodify(current_file, ":h")

                -- Find the Git root from the current file's directory
                local git_root =
                    vim.fn.systemlist("git -C " .. vim.fn.shellescape(current_dir) .. " rev-parse --show-toplevel")[1]

                if vim.v.shell_error == 0 then
                    builtin.live_grep({ search_dirs = { git_root }, prompt_title = "Search in repo" })
                else
                    builtin.live_grep()
                end
            end, { noremap = true, silent = true })

            -- Find files in the root of the Git repo based on current buffer
            vim.keymap.set("n", "<leader>f", function()
                -- Get the directory of the current file
                local current_file = vim.api.nvim_buf_get_name(0)
                local current_dir = vim.fn.fnamemodify(current_file, ":h")

                -- Find the Git root for that directory
                local git_root =
                    vim.fn.systemlist("git -C " .. vim.fn.shellescape(current_dir) .. " rev-parse --show-toplevel")[1]

                if vim.v.shell_error == 0 then
                    -- Search for files starting from the Git root
                    builtin.find_files({ cwd = git_root, prompt_title = "Files in repo" })
                else
                    builtin.find_files()
                end
            end, { noremap = true, silent = true })

            vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#2a2b3c", fg = "#cdd6f4" })
            vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "#2a2b3c", fg = "#ffa500" })
        end,
    },
}

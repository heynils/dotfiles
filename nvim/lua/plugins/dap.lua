return {
    {
        "mfussenegger/nvim-dap",
        dependencies = { "theHamsta/nvim-dap-virtual-text" },
        lazy = true,
        config = function()
            local dap = require("dap")
            local DEBUGGER_LOCATION = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/netcoredbg"
            vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "Error", linehl = "", numhl = "" })
            vim.fn.sign_define("DapStopped", { text = "▶", texthl = "String", linehl = "Debug", numhl = "" })

            dap.adapters.coreclr = {
                type = "executable",
                command = DEBUGGER_LOCATION,
                args = { "--interpreter=vscode" },
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
                    end,
                },
            }

            vim.keymap.set("n", "<F9>", function()
                dap.toggle_breakpoint()
            end)
            vim.keymap.set("n", "<F12>", function()
                dap.clear_breakpoints()
            end)
            vim.keymap.set("n", "<F5>", function()
                dap.continue()
            end)
            vim.keymap.set("n", "<F10>", function()
                dap.step_over()
            end)
            vim.keymap.set("n", "<F11>", function()
                dap.step_into()
            end)
            vim.keymap.set("n", "<F7>", function()
                dap.step_out()
            end)
            require("nvim-dap-virtual-text").setup()
        end,
    },
}

return {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
        require("dapui").setup()
        local dap = require("dap")
        dap.listeners.after.event_initialized["dapui_config"] = function()
            require("dapui").open()
        end
        dap.listeners.after.event_terminated["dapui_config"] = function()
            require("dapui").close()
        end
        dap.listeners.after.event_exited["dapui_config"] = function()
            require("dapui").close()
        end
    end,
}

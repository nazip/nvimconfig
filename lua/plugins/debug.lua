return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"leoluz/nvim-dap-go",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			-- Setup UI and virtual text extensions
			dapui.setup()
			require("nvim-dap-virtual-text").setup()

			-- Automatically configure delve with nvim-dap-go
			require("dap-go").setup({
				-- Additional delve configurations if needed (e.g. build flags)
				delve = {
					path = "dlv", -- Ensures dlv binary is picked up from your PATH
				},
			})

			-- Hook up DAP UI to automatically open and close
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- Essential Keymaps
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug: Step Over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug: Step Into" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug: Step Out" })
			vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
			vim.keymap.set("n", "<leader>B", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Debug: Set Conditional Breakpoint" })

			-- Go-specific debugging keymaps via nvim-dap-go
			vim.keymap.set("n", "<leader>dt", require("dap-go").debug_test, { desc = "Debug: Go Test" })
			vim.keymap.set("n", "<leader>dl", require("dap-go").debug_last_test, { desc = "Debug: Go Last Test" })
		end,
	},
}

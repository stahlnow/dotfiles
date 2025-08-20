return {
   "mfussenegger/nvim-dap",
   dependencies = {
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "theHamsta/nvim-dap-virtual-text",
   },
   config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local dap_python = require("dap-python")

      require("dapui").setup({})
      require("nvim-dap-virtual-text").setup({
         commented = true, -- Show virtual text alongside comment
      })

      dap_python.setup("python3")

      vim.fn.sign_define("DapBreakpoint", {
         text = "",
         texthl = "DiagnosticSignError",
         linehl = "",
         numhl = "",
      })

      vim.fn.sign_define("DapBreakpointRejected", {
         text = "", -- or "❌"
         texthl = "DiagnosticSignError",
         linehl = "",
         numhl = "",
      })

      vim.fn.sign_define("DapStopped", {
         text = "", -- or "→"
         texthl = "DiagnosticSignWarn",
         linehl = "Visual",
         numhl = "DiagnosticSignWarn",
      })

      -- Automatically open/close DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
         dapui.open()
      end

      local opts = { noremap = true, silent = true }

      -- Toggle breakpoint
      vim.keymap.set("n", "<f5>", function()
         dap.toggle_breakpoint()
      end, opts)

      -- Toggle DAP UI
      vim.keymap.set("n", "<f6>", function()
         dapui.toggle()
      end, opts)

      -- Continue / Start
      vim.keymap.set("n", "<f7>", function()
         dap.continue()
      end, opts)

      -- Step Over
      vim.keymap.set("n", "<f8>", function()
         dap.step_over()
      end, opts)

      -- Step Into
      vim.keymap.set("n", "<f9>", function()
         dap.step_into()
      end, opts)

      -- Step Out
      vim.keymap.set("n", "<f10>", function()
         dap.step_out()
      end, opts)

      vim.keymap.set("n", "<f3>", function()
         dapui.eval()
      end, opts)

      -- Keymap to terminate debugging
      vim.keymap.set("n", "<f12>", function()
         require("dap").terminate()
      end, opts)
   end,
}

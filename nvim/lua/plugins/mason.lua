-- lsp tooling / related mappings
-- https://github.com/mason-org/mason.nvim
-- Usage: :Mason
-- registry: https://mason-registry.dev/registry/list
return {
   "mason-org/mason.nvim",
   dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
   },
   lazy = false, -- eager load
   config = function()
      local mason = require("mason")
      local masonlsp = require("mason-lspconfig")

      mason.setup()

      -- NOTE: most lsp configuration come from neovim/nvim-lspconfig plugin dependency
      -- see: https://github.com/neovim/nvim-lspconfig

      -- masonlsp helps auto-installing servers
      -- and i keep masonlsp mainly for the few extra configs it has:
      -- see https://github.com/mason-org/mason-lspconfig.nvim/tree/main/lua/mason-lspconfig/lsp

      masonlsp.setup({
         -- NOTE: we explicitly enable plugins in lua/lsp/init
         automatic_enable = false,

         -- NOTE: auto install some servers
         ensure_installed = {
            "jsonls",
            "html",
            "cssls",
            "basedpyright",
            "ruff",
            "ts_ls",
            "vue_ls",
            "vtsls",
            "lua_ls",
            -- "gopls",
            "eslint",
         },
      })
   end,
}

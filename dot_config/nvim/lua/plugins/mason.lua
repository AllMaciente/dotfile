return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "pyright" },
      })

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Auto setup dos LSPs instalados
      require("mason-lspconfig").setup_handlers({
        function(server)
          lspconfig[server].setup({ capabilities = capabilities })
        end,
      })
    end,
  },
}


return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      ensure_installed = { "lua_ls", "clangd", "rust_analyzer", "html" },
      -- automatic_enable is true by default in v2 — it calls
      -- vim.lsp.enable() for every server installed via Mason.
    },
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Apply nvim-cmp capabilities to every server as a default.
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- Per-server overrides go here. Examples (uncomment / edit as needed):
      -- vim.lsp.config("lua_ls", {
      --   settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      -- })
      -- vim.lsp.config("clangd", {
      --   cmd = { "clangd", "--background-index", "--clang-tidy", "--header-insertion=never" },
      -- })

      -- Keymaps: attach buffer-local so they only fire where LSP is active.
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buf = args.buf
          local map = function(lhs, rhs) vim.keymap.set("n", lhs, rhs, { buffer = buf }) end
          map("K",           vim.lsp.buf.hover)
          map("<leader>gd",  vim.lsp.buf.definition)
          map("<leader>gr",  vim.lsp.buf.references)
          map("<leader>ca",  vim.lsp.buf.code_action)
        end,
      })
    end,
  },
}

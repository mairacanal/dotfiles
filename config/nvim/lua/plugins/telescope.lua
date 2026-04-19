return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      local builtin = require("telescope.builtin")

      -- File Pickers
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>gf", builtin.git_files, {})
      vim.keymap.set("n", "<leader>gs", builtin.grep_string, {})
      vim.keymap.set("n", "<leader>lg", builtin.live_grep, {})
      -- Vim Pickers
      vim.keymap.set("n", "<leader>b", builtin.buffers, {})
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
      -- LSP Pickers
      vim.keymap.set("n", "<leader>fs", builtin.lsp_dynamic_workspace_symbols, {})
      -- Git Pickers
      vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
      vim.keymap.set("n", "<leader>gst", builtin.git_status, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}

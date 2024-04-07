return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
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

      -- Git Pickers
      vim.keymap.set("n", "<leader>gc", builtin.git_bcommits, {})

      require("telescope").load_extension("ui-select")
    end,
  },
}

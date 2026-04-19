return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = function()
      require("nvim-treesitter").install({
        "c", "diff", "html", "lua", "markdown", "markdown_inline",
        "meson", "python", "query", "rust", "vim", "vimdoc",
      }):wait(300000)
    end,
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          -- Silently skip filetypes with no parser (e.g. `alpha`, `help`, `TelescopePrompt`).
          if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}

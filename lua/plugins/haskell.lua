return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "haskell",
      })
    end,
  },
  {
    "mrcjkb/haskell-tools.nvim",
    ft = { "haskell", "lhaskell", "cabal", "cabalproject" },
    keys = {
      { "<leader>cq", vim.lsp.codelens.run, desc = "Lens Action" },
    },
    config = function()
      require("haskell-tools")

      ---@type HTOpts
      vim.g.haskell_tools = {
        ---@type ToolsOpts
        tools = {
          hover = { enable = false },
        },
      }
    end,
  },
}

return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  -- { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.pack.python" },
  {
    "linux-cultist/venv-selector.nvim",
    opts = { name = ".env" },
    keys = { { "<leader>lv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
}

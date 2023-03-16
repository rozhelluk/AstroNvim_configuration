return {
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  "luisiacc/gruvbox-baby",
  -- "Pocco81/auto-save.nvim",
  -- "XkbSwitchEnabled",
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" },
  dapui = function(config) -- parameter is the default setup config table
    local dap = require "dap"
    dap.listeners.after.event_initialized["dapui_config"] = nil
    dap.listeners.before.event_terminated["dapui_config"] = nil
    dap.listeners.before.event_exited["dapui_config"] = nil

    -- modify config table if necessary to configure `nvim-dap-ui`
    return config
  end,
}

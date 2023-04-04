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
  {
    "declancm/cinnamon.nvim",
    config = function() require("cinnamon").setup() end,
  },
  {
    "karb94/neoscroll.nvim",
    lazy = false,
    config = function()
      require("neoscroll").setup {
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true,          -- Hide cursor while scrolling
        stop_eof = true,             -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil,       -- Default easing function
        pre_hook = nil,              -- Function to run before the scrolling animation starts
        post_hook = nil,             -- Function to run after the scrolling animation ends
        performance_mode = false,    -- Disable "Performance Mode" on all buffers.
      }
    end,
  },
  { "Pocco81/auto-save.nvim", lazy = false },
  -- "XkbSwitchEnabled",
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  { "kevinhwang91/nvim-ufo",  requires = "kevinhwang91/promise-async" },
  dapui = function(config) -- parameter is the default setup config table
    local dap = require "dap"
    dap.listeners.after.event_initialized["dapui_config"] = nil
    dap.listeners.before.event_terminated["dapui_config"] = nil
    dap.listeners.before.event_exited["dapui_config"] = nil

    -- modify config table if necessary to configure `nvim-dap-ui`
    return config
  end,
}

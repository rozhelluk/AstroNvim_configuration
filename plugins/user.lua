return {
  "luisiacc/gruvbox-baby",
  {
    "linux-cultist/venv-selector.nvim",
    opts = { name = ".env" },
    keys = { { "<leader>lv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },
  -- "XkbSwitchEnabled",
  dapui = function(config) -- parameter is the default setup config table
    local dap = require "dap"
    dap.listeners.after.event_initialized["dapui_config"] = nil
    dap.listeners.before.event_terminated["dapui_config"] = nil
    dap.listeners.before.event_exited["dapui_config"] = nil

    -- modify config table if necessary to configure `nvim-dap-ui`
    return config
  end,
  -- { "m00qek/baleia.nvim", tag = "v1.3.0" },
  -- {
  --   "samodostal/image.nvim",
  --   config = function(_, opts)
  --     require("image").setup {
  --       render = {
  --         min_padding = 5,
  --         show_label = true,
  --         use_dither = true,
  --         foreground_color = false,
  --         background_color = false,
  --       },
  --       events = {
  --         update_on_nvim_resize = true,
  --       },
  --     }
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   event = "VeryLazy",
  -- },
  {
    "samodostal/image.nvim",
    enabled = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "m00qek/baleia.nvim",
    },
    config = function()
      require("image").setup {
        render = {
          min_padding = 5,
          show_label = true,
          use_dither = true,
          foreground_color = true,
          background_color = true,
        },
        events = {
          update_on_nvim_resize = true,
        },
      }
    end,
    event = "VeryLazy",
  },
}

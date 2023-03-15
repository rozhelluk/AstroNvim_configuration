return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
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
    "pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup {

        enabled = true,        -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
        execution_message = {
          message = function() -- message to print on save
            return ("AutoSave: saved at " .. vim.fn.strftime "%H:%M:%S")
          end,
          dim = 0.18,                                      -- dim the color of `message`
          cleaning_interval = 1250,                        -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
        },
        trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
        -- function that determines whether to save the current buffer or not
        -- return true: if buffer is ok to be saved
        -- return false: if it's not ok to be saved
        condition = function(buf)
          local fn = vim.fn
          local utils = require "auto-save.utils.data"

          if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
            return true            -- met condition(s), can save
          end
          return false             -- can't save
        end,
        write_all_buffers = false, -- write all buffers when the current one meets `condition`
        debounce_delay = 135,      -- saves the file at most every `debounce_delay` milliseconds
        callbacks = {
          -- functions to be executed at different intervals
          enabling = nil,              -- ran when enabling auto-save
          disabling = nil,             -- ran when disabling auto-save
          before_asserting_save = nil, -- ran before checking `condition`
          before_saving = nil,         -- ran before doing the actual save
          after_saving = nil,          -- ran after doing the actual save
        },
      }
    end,
  },
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

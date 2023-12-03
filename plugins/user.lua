return {
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
  -- {
  --   "samodostal/image.nvim",
  --   enabled = true,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "m00qek/baleia.nvim",
  --   },
  --   config = function()
  --     require("image").setup {
  --       render = {
  --         min_padding = 5,
  --         show_label = true,
  --         use_dither = true,
  --         foreground_color = true,
  --         background_color = true,
  --       },
  --       events = {
  --         update_on_nvim_resize = true,
  --       },
  --     }
  --   end,
  --   event = "VeryLazy",
  -- },

  {
    "jake-stewart/jfind.nvim",
    -- branch = "1.0",
    keys = {
      {
        "<c-f>",
        function()
          local Key = require "jfind.key"
          require("jfind").findFile {
            formatPaths = true,
            callback = {
              [Key.DEFAULT] = vim.cmd.edit,
              [Key.CTRL_S] = vim.cmd.split,
              [Key.CTRL_V] = vim.cmd.vsplit,
            },
          }
        end,
      },
    },
    config = function()
      require("jfind").setup {
        exclude = {
          ".git",
          ".idea",
          ".vscode",
          ".sass-cache",
          ".class",
          "__pycache__",
          "node_modules",
          "target",
          "build",
          "tmp",
          "assets",
          "dist",
          "public",
          "*.iml",
          "*.meta",
        },
        border = "rounded",
        formatPaths = true,
        key = "<c-f>",
        tmux = true,
      }
    end,
  },
  {
    "andweeb/presence.nvim",
    config = function(_, opts)
      require("presence").setup {
        auto_update = true,
        neovim_image_text = "The One True Text Editor",
        main_image = "neovim", --(either "neovim" or "file")
        client_id = "793271441293967371",
        log_level = nil, --("debug", "info", "warn", "error")
        debounce_timeout = 10,
        enable_line_number = true,
        blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
        buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
        file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
        show_time = true,

        editing_text = "Editing...", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
        file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
        git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
        plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
        reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
        workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
        line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
      }
    end,

    event = "VeryLazy",
  },
  -- {
  --   "niuiic/translate.nvim",
  --
  --   event = "VeryLazy",
  --   dependencies = { "niuiic/core.nvim" },
  --
  --   config = function()
  --     require("translate").setup {
  --       output = {
  --         float = {
  --           -- max_width of float window
  --           max_width = 40,
  --           -- max_height of float window
  --           max_height = 5,
  --           -- whether close float window on cursor move
  --           close_on_cursor_move = true,
  --           -- key to enter float window
  --           enter_key = "T",
  --         },
  --       },
  --       translate = {
  --         {
  --           -- use :TransToZH to start this job
  --           cmd = "TransToZH",
  --           -- shell command
  --           -- translate-shell is used here
  --           command = "trans",
  --           -- shell command args
  --           args = function(trans_source)
  --             -- trans_source is the text you want to translate
  --             return {
  --               "-b",
  --               "-e",
  --               "google",
  --               -- use proxy
  --               -- "-x",
  --               -- "http://127.0.0.1:10025",
  --               "-t",
  --               "zh-CN",
  --               -- you can filter translate source here
  --               trans_source,
  --             }
  --           end,
  --           -- how to get translate source
  --           -- selection | input | clipboard
  --           input = "clipboard",
  --           -- how to output translate result
  --           -- float_win | notify | clipboard | insert
  --           output = { "notify", "clipboard", "float_win", "insert" },
  --         },
  --         {
  --           cmd = "TransToEN",
  --           command = "trans",
  --           args = function(trans_source)
  --             return {
  --               "-b",
  --               "-e",
  --               "google",
  --               "-t",
  --               "en",
  --               trans_source,
  --             }
  --           end,
  --           input = "input",
  --           output = { "notify", "clipboard", "float_win", "insert" },
  --         },
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   "potamides/pantran.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("pantran").setup {
  --       -- Default engine to use for translation. To list valid engine names run
  --       -- `:lua =vim.tbl_keys(require("pantran.engines"))`.
  --       default_engine = "google",
  --       -- Configuration for individual engines goes here.
  --       engines = {
  --         google = {
  --           -- Default languages can be defined on a per engine basis. In this case
  --           -- `:lua require("pantran.async").run(function()
  --           -- vim.pretty_print(require("pantran.engines").yandex:languages()) end)`
  --           -- can be used to list available language identifiers.
  --           default_source = "en",
  --           default_target = "en",
  --         },
  --       },
  --       controls = {
  --         mappings = {
  --           edit = {
  --             n = {
  --               -- Use this table to add additional mappings for the normal mode in
  --               -- the translation window. Either strings or function references are
  --               -- supported.
  --               ["j"] = "gj",
  --               ["k"] = "gk",
  --             },
  --             i = {
  --               -- Similar table but for insert mode. Using 'false' disables
  --               -- existing keybindings.
  --               ["<C-y>"] = false,
  --               ["<C-a>"] = require("pantran.ui.actions").yank_close_translation,
  --             },
  --           },
  --           -- Keybindings here are used in the selection window.
  --           select = {
  --             n = {
  --               -- ...
  --             },
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
}

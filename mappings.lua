-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    ["<S-l>"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    -- ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command
    [";"] = { ":" },
    ["<M-l>"] = {
      function() vim.diagnostic.open_float() end,
      desc = "Hover diagnostics",
    },

    ["<M-k>"] = {
      function()
        vim.diagnostic.config {
          virtual_text = not require("lsp_lines").toggle(),
        }
      end,
      desc = "Toggle virtual diagnostic lines",
    },
    -- ["<leader>n"] = { ":ASToggle<CR>", desc = "Toggle autosave" },
    ["<F2>"] = { "<cmd>!toggle_vim_opacity.sh<cr><cr>", desc = "toggle vim opacity" },
    ["<F3>"] = { "<cmd>!set_alacritty_opacity.sh<cr><cr>", desc = "toggle alacritty opacity" },
    ["<F5>"] = { ":w<CR>:exec '!python3 -B' shellescape(@%, 1)<CR>" },
    ["<F4>"] = { ":w<CR>:vsplit term://python3 -B %<cr>i" },
    ["<F8>"] = { ":w<CR>:exec '!g++ -Wall % && ./a.out' shellescape(@%, 1)<CR>" },
    ["<F9>"] = { ":w<CR>:vsplit term://g++ -Wall % && ./a.out<cr>i" },
    -- ["<F6>"] = { "vim.bo.filetype" },
  },
  i = {
    ["<F5>"] = { ":w<CR>:exec '!python3.11 -B' shellescape(@%, 1)<CR>" },
    ["<F4>"] = { ":w<CR>:vsplit term://python3.11 -B %<cr>i" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<F5>"] = false,
    ["<F17>"] = false,
    ["<F29>"] = false,
    ["<F6>"] = false,
    ["<F9>"] = false,
    ["<F10>"] = false,
    ["<F11>"] = false,
    ["<F23>"] = false,
  },
  v = {
    ["y"] = { "ygv" },
    ['"'] = { 'xi"<esc>pa"<esc>' },
    ["'"] = { "xi'<esc>pa'<esc>" },
    ["v["] = { "xi[<esc>pa]<esc>" },
    ["v]"] = { "xi[<esc>pa]<esc>" },
    ["v{"] = { "xi{<esc>pa}<esc>" },
    ["v}"] = { "xi{<esc>pa}<esc>" },
    ["("] = { "xi(<esc>pa)<esc>" },
    [")"] = { "xi(<esc>pa)<esc>" },
  },
  -- vim.keymap.set("v", "<C-t>", "<cmd>TransToZH<CR>", { silent = true }),
  -- vim.keymap.set("n", "<space>T", "<cmd>TransToEN<CR>")
  --
  --{
}

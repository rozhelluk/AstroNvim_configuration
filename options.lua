-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    -- set to true or false etc.
    autochdir = true,
    relativenumber = true,
    spell = true,
    wrap = true,
    colorcolumn = "80,120",
    swapfile = false,
    encoding = "UTF-8",
    fileencoding = "UTF-8",
    tabstop = 4,
    showtabline = 2,
    laststatus = 0,
    scrolloff = 4
  },
  g = {
    cmp_enabled = true,
    autopairs_enabled = true,
    diagnostics_mode = 3,            -- (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    icons_enabled = true,            -- requires :PackerSync after changing) 
    ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    status_diagnostics_enabled = true,
    autoformat_enabled = false,
    mkdp_auto_start = 0,
    mkdp_auto_close = 1,
    mkdp_echo_preview_url = 1,
  },
}
-- If you need more control, you can use the function()...end notation
--
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end

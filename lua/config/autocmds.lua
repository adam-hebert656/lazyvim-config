-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local wk = require("which-key")

wk.register({
  ["<leader>T"] = { name = "ToggleTerm" },
  ["<leader>h"] = { name = "arrow" },
  ["<leader>hh"] = { "<cmd>Arrow open<cr>", "File Bookmarks Menu" },
  ["<leader>hm"] = { "<cmd>lua require('arrow.buffer_ui').openMenu()<cr>", "Buffer Bookmarks Menu" },
})

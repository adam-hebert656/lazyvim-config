-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
if (vim.loop.os_uname().sysname == "Darwin") then
  vim.o.guifont = "Comic Code:h14"
else
  vim.o.guifont = "Comic Code:h12"
end

local wk = require("which-key")

wk.register({
  ["<leader>T"] = { name = "ToggleTerm" },
  ["<leader>h"] = { name = "arrow" },
  ["<leader>hh"] = { "<cmd>Arrow open<cr>", "File Bookmarks Menu" },
  ["<leader>hm"] = { "<cmd>lua require('arrow.buffer_ui').openMenu()<cr>", "Buffer Bookmarks Menu" },
  ["<leader>d"] = { name = "Elixir" },
  ["<leader>do"] = { "<cmd>lua require('elixir-extras').elixir_view_docs({include_mix_libs=true})<cr>", "Show Elixir Docs" }
})


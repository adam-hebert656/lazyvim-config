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

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr) end

local lspconfig = require("lspconfig")

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Enable the following language servers
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local lsp_options = {
	capabilities = capabilities,
	on_attach = on_attach,
	single_file_support = true,
}

lspconfig.elixirls.setup(vim.tbl_extend("force", lsp_options, {
  cmd = { "elixir-ls" },
  settings = { elixirLS = { dialyzerEnabled = false } },
}))

lspconfig.tailwindcss.setup(vim.tbl_extend("force", lsp_options, {
  filetypes = { "html", "elixir", "eelixir", "heex" },
  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex",
    },
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          'class[:]\\s*"([^"]*)"',
        },
      },
    },
  },
}))

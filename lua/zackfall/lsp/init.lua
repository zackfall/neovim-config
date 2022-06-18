----------------
-- Main Files --
----------------

local lspconfig_status = pcall(require, "lspconfig")

if not lspconfig_status then
  vim.notify("Please Install 'nvim-lspconfig'")
  return
end

require("zackfall.lsp.handlers").setup()
require("zackfall.lsp.servers")

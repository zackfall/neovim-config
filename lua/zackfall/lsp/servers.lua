-- LSP Servers to install

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local langservers = {
  'sumneko_lua',      -- Lua
  'vimls',            -- Vim
  'texlab',           -- LaTeX
  'pyright',          -- Python
  'bashls',           -- Bash
  'clangd',           -- C++,C
  'cmake',            -- CMake
  'html',             -- HTML
  'cssls',            -- CSS
  'jsonls',           -- JSON
  'rust_analyzer',    -- Rust
  'tsserver',         -- Typescript/Javascript
  'vuels',            -- Vue
  'yamlls',           -- Yaml
  'dockerls',         -- Docker
  'sqlls',            -- SQL
}

local config = {
  -- disable virtual text
  virtual_text = true,
  -- show signs
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

for _, server in ipairs(langservers) do
  if server == 'sumneko_lua' then
    require('lspconfig')[server].setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use' }
          },
        }
      }
    }
  else
    require('lspconfig')[server].setup {
      capabilities = capabilities,
    }
  end

  require('lsp_signature').setup({ hi_parameter = "IncSearch" })
end

require('goto-preview').setup {}

require('lspconfig').sqls.setup{
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
    end
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "true", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

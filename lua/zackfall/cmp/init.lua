  local cmp_status_ok, cmp = pcall(require, "cmp")
  if not cmp_status_ok then
    return
  end

  local cmp_dap_status_ok, cmp_dap = pcall(require, "cmp_dap")
  if not cmp_dap_status_ok then
    return
  end

  local icons = require("zackfall.icons")
  local kind_icons = icons.kind

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },

    enabled = function()
      return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or cmp_dap.is_dap_buffer()
    end,

    mapping = cmp.mapping.preset.insert {
      ["<C-y>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),

      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),

      ['<A-j>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<A-k>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),

    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])

      if entry.source.name == "cmp_tabnine" then
        -- if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
        -- menu = entry.completion_item.data.detail .. " " .. menu
        -- end
        vim_item.kind = icons.misc.Robot
      end
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- NOTE: order matters
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
        ultisnips = "[Snippet]",
        calc = "[Calculator]",
        gh_issues = "[Issues]",
        path = "[Path]",
        buffer = "[Buffer]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "latex_symbols" },
		{ name = "ultisnips" },
		{ name = "calc" },
		{ name = "path" },
		{ name = "buffer" },
    { name = "gh_issues" },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  -- documentation = true,
  window = {
    -- documentation = "native",
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
    },
    completion = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
      winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
    },
  },
  experimental = {
    ghost_text = true,
    native_menu = false,
  },
}

require('zackfall.cmp.cmp_github_issues')
require('zackfall.cmp.cmp_emails').setup()

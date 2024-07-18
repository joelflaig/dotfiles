-- EXAMPLE 
local lspconfig = require "lspconfig"
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

local servers = {
  "html",
  "lua_ls",
  "cssls",
  "clangd",
  "rust_analyzer",
  "mojo",
}

mason_lspconfig.setup {
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
  },
}

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "",
      package_uninstalled = "✗",
    },
  },
  ensure_installed = {
    "lua_language_server",
    "rust_analyzer",
  }
})

-- LSP settings (for overriding per client)
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"}),
}

-- diagnostics window
vim.diagnostic.config {
  float = { border = "rounded" },
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
    handlers = handlers,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo", numhl = "" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌶 ", texthl = "DiagnosticSignHint", numhl = "" })

local cmp_kinds = {
  Text = "󰉿",
  Method = "󰆧",
  Function = "󰊕",
  Constructor = "",
  Field = "󰜢",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "󰜢",
  Unit = "󰑭",
  Value = "󰎠",
  Enum = "",
  Keyword = "󰌋",
  Snippet = "",
  Color = "󰏘",
  File = "",
  Reference = "",
  Folder = "󰉋",
  EnumMember = "󰎦",
  Constant = "󰏿",
  Struct = "",
  Event = "⚡",
  Operator = "",
  TypeParameter = "",
  Codeium = "",
}

local cmp = require 'cmp'
local luasnip = require "luasnip"

cmp.setup{

  formatting = {
    fields = {
      'abbr',
      'kind',
      'menu'
    },
    expandable_indicator = true,
    format = function(_, vim_item)
      vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. " " .. vim_item.kind
      return vim_item
    end,
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  mapping = cmp.mapping.preset.insert({
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select })
        elseif luasnip.locally_jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        elseif luasnip.locally_jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),

      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),

      ['<CR>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          if luasnip.expandable() then
            luasnip.expand()
          else
            cmp.confirm({select = true,})
          end
        else
            fallback()
        end
      end),
    }),

  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lsp_signature_help" },
    { name = "luasnip" },
    { name = "codeium" },
  },

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  }),

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = {
      disallow_symbol_nonprefix_matching = false,
      disallow_fuzzy_matching = false,
      disallow_partial_matching = false,
      disallow_prefix_unmatching = false,
      disallow_fullfuzzy_matching = false,
      disallow_partial_fuzzy_matching = false,
    }
  }),
}

return {}


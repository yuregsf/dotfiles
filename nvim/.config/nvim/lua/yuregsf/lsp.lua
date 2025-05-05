local lspconfig = require 'lspconfig'


local capabilities = require('blink.cmp').get_lsp_capabilities()


lspconfig.ts_ls.setup {
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  root_dir = lspconfig.util.root_pattern("yarn.lock", "package.json", "tsconfig.json", "jsconfig.json", ".git"),

  init_options = {
    plugins = {
      {
        name = 'typescript-styled-plugin',
        location = '/lib/node_modules/typescript-styled-plugin'
      }
    }
  }
}


lspconfig.clangd.setup {
  capabilities = capabilities,
}
lspconfig.pyright.setup {
  capabilities = capabilities,
}

lspconfig.html.setup {
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  capabilities = capabilities,
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}

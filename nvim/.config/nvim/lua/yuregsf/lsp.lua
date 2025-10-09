local capabilities = require('blink.cmp').get_lsp_capabilities()


vim.lsp.config('ts_ls', {
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "yarn.lock", "package.json", "tsconfig.json", "jsconfig.json", ".git" },

  init_options = {
    plugins = {
      {
        name = 'typescript-styled-plugin',
        location = '/lib/node_modules/typescript-styled-plugin'
      }
    }
  }
})


vim.lsp.config('clangd', {
  capabilities = capabilities,
})

vim.lsp.config('pyright', {
  capabilities = capabilities,
})

vim.lsp.config('html', {
  capabilities = capabilities,
})

vim.lsp.config('cssls', {
  capabilities = capabilities,
})

vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.tsserver.setup{
  capabilities = capabilities,
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


lspconfig.clangd.setup{
  capabilities = capabilities,
}
lspconfig.pyright.setup{

  capabilities = capabilities,
}
lspconfig.tailwindcss.setup{

  capabilities = capabilities,
}
require'lspconfig'.vuels.setup{}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
      capabilities = capabilities
    },
  },
}

local pid = vim.fn.getpid()

lspconfig.omnisharp.setup{
    cmd = { "/usr/bin/omnisharp", "--languageserver", "--hostPID", tostring(pid) },
    root_dir = lspconfig.util.root_pattern('*.sln', '*.csproj')
}

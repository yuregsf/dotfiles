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

-- require'lspconfig'.lua_ls.setup {
--   settings = {
--     Lua = {
--       runtime = {
--         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--         version = 'LuaJIT',
--         -- Setup your lua path
--         path = runtime_path,
--       },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--       capabilities = capabilities
--     },
--   },
-- }

local pid = vim.fn.getpid()

-- lspconfig.omnisharp.setup{
--   cmd = { "mono","/usr/lib/omnisharp-roslyn/OmniSharp.dll", "--languageserver", "--hostPID", tostring(pid)},
--   root_dir = lspconfig.util.root_pattern('*.sln', '*.csproj'),
--   on_attach = function (client, bufnr)
--     -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483#issuecomment-1492605642
--     local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
--     for i, v in ipairs(tokenModifiers) do
--       tmp = string.gsub(v, ' ', '_')
--       tokenModifiers[i] = string.gsub(tmp, '-_', '')
--     end
--     local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
--     for i, v in ipairs(tokenTypes) do
--       tmp = string.gsub(v, ' ', '_')
--       tokenTypes[i] = string.gsub(tmp, '-_', '')
--     end
--   end,
-- }

-- lspconfig.csharp_ls.setup{
--   capabilities = capabilities,
-- }

lspconfig.html.setup {
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  capabilities = capabilities,
}

lspconfig.eslint.setup {
  packageManager= 'yarn'
}

lspconfig.tailwindcss.setup {
  capabilities = capabilities,
}

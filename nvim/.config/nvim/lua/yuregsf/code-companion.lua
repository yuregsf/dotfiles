require 'codecompanion'.setup {
    adapters = {
        copilot = function()
            return require 'codecompanion.adapters'.extend('copilot', {
                schema = {
                    model = {
                        default = 'claude-3.5-sonnet'
                    }
                }
            })
        end,
    }
}

local nnoremap = require("yuregsf.keymap").nnoremap

nnoremap("<leader>CC", ":CodeCompanionChat<CR>")

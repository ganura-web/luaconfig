-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local servers = { "html", "cssls", "marksman", "svelte", 'lua_ls', 'ts_ls' }

--Enable (broadcasting) snippet capability for completion
local csscapabilities = vim.lsp.protocol.make_client_capabilities()
csscapabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config("cssls", {
  capabilities = csscapabilities
})

for _, server in ipairs(servers) do
  vim.lsp.config(server, {
    capabilities = capabilities,
    on_attach = on_attach,
    on_init = on_init,
  })
end

vim.lsp.enable(servers)

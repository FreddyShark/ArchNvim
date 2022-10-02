-------------------------------
------- nvim-lspconfig --------
-------------------------------


-- This is adding nvim-cmp capabilites to the lsp.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

function settings()
vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer=0})
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer=0})
vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer=0})
vim.keymap.set("n", "gx", vim.diagnostic.goto_next, {buffer=0})
end

require 'lspconfig'.gopls.setup{
	capabilities = capabilities,
	on_attach = settings,
}

require 'lspconfig'.pyright.setup{
	capabilities = capabilities,
	on_attach = settings,
}

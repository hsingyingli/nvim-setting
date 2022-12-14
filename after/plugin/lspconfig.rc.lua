local status, nvim_lsp = pcall(require, 'lspconfig')
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<S-e>', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

  -- LSP formatting
  require("lsp-format").on_attach(client)
end

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

---- Completion kinds
--local servers = {
	----"clangd",
	--"tsserver",
	--"pyright",
	--"yamlls",
	--"jsonls",
  --"dockerls",
  --"sqlls",
	--"cssls",
	--"html",
  --"gopls"
--}

--for _, lsp in pairs(servers) do
	--nvim_lsp[lsp].setup({
		--on_attach = on_attach,
		--capabilities = capabilities,
	--})
--end
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.pyright.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}


nvim_lsp.cssls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.html.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.dockerls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.tailwindcss.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.jsonls.setup{}
nvim_lsp.sqlls.setup{}


vim.diagnostic.config({
  virtual_text = false
})



-- Show line diagnostics automatically in hover window
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

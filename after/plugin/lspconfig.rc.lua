local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require("lsp-format").on_attach(client)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  
  if client.name == "eslint" then
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end
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
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    }
})

nvim_lsp.solargraph.setup {
  capabilities = capabilities,
  settings = {
    completion = true,
    diagnostic = true,
    folding = true,
    references = true,
    rename = true,
    symbols = true,
  }
}

nvim_lsp.tsserver.setup {
  --on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities
}

nvim_lsp.stylelint_lsp.setup {
  settings = {
    stylelintplus = {
      autoFixOnSave = true,
      autoFixOnFormat = true,
      -- other settings...
    }
  },
}

nvim_lsp.eslint.setup{
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.astro.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.pylsp.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pylsp = {
      plugins = {
        -- formatter options
        black = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },

        -- linter options
        --pylint = { enabled = true, executable = "pylint" },
        pyflakes = { enabled = true },
        pycodestyle = { enabled = false },

        -- type checker
        pylsp_mypy = { enabled = false },

        -- auto-completion options
        jedi_completion = { fuzzy = true },

        -- import sorting
        pyls_isort = { enabled = true },
      }
    }
  }
}

--nvim_lsp.pyright.setup{
  --on_attach = on_attach,
  --capabilities = capabilities,
--}

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

nvim_lsp.bufls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
--nvim_lsp.ruby_ls.setup{
  --capabilities = capabilities,
--}

nvim_lsp.rubocop.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}

nvim_lsp.jsonls.setup{}
nvim_lsp.sqlls.setup{}


vim.diagnostic.config({
  virtual_text = false
})
-- disable virtial text but it did not disable float text
--vim.diagnostic.disable()

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always", -- Or "if_many"
  },
})


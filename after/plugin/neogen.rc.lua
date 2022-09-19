local status, neogen = pcall(require, "neogen")
if (not status) then return end

local opts = { noremap = true, silent = true }
neogen.setup(
  {
    snippet_engine = "luasnip",
  }
)
vim.api.nvim_set_keymap("n", "nc", ":lua require('neogen').generate({ type = 'class' })<CR>", opts)
vim.api.nvim_set_keymap("n", "nf", ":lua require('neogen').generate({ type = 'func' })<CR>", opts)
vim.api.nvim_set_keymap("n", "nt", ":lua require('neogen').generate({ type = 'type' })<CR>", opts)

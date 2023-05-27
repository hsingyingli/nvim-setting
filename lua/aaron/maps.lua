local keymap = vim.keymap
local opts = { noremap = true, silent = true }
keymap.set('n', 'x', '"_x')
keymap.set('n', 'dw', 'vb"_d')
-- New tab
keymap.set('n', 'te', ':tabedit<Return>', { silent = true})
keymap.set('n', '<S-Tab>', ':tabprev<Return>', {silent = true})
keymap.set('n', '<Tab>', ':tabnext<Return>', {silent = true})

-- Split Window
keymap.set('n', 'ss', ':split<Return><C-w>w', {silent = true})
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', {silent = true})

-- Move window
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w>h', '<C-w><')
keymap.set('n', '<C-w>l', '<C-w>>')
keymap.set('n', '<C-w>k', '<C-w>+')
keymap.set('n', '<C-w>j', '<C-w>-')


keymap.set("n", "sf", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = true }))<cr>", opts)
keymap.set("n", "<C-e>", ":noh<Return>")


-- New Outline
keymap.set("n", "so", ":SymbolsOutline<Return>", {silent = true})

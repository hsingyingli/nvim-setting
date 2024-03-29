--vim.opt.list = true

--require("indent_blankline").setup {
    --show_current_context = true,
    --show_current_context_start = true,
--}

--vim.opt.list = true
--vim.opt.listchars:append "space:⋅"
--vim.opt.listchars:append "eol:↴"

--require("indent_blankline").setup {
    --space_char_blankline = " ",
    --show_current_context = true,
    --show_current_context_start = true,
--}

vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars:append "eol:↴"
--vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
--vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    char = "",
    --char_highlight_list = {
        --"IndentBlanklineIndent1",
        --"IndentBlanklineIndent2",
    --},
    --space_char_highlight_list = {
        --"IndentBlanklineIndent1",
        --"IndentBlanklineIndent2",
    --},
    show_trailing_blankline_indent = false,
}

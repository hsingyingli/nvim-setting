-- Default options:
--require('kanagawa').setup({
    --transparent = false,         -- do not set background color
    --dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    --terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    --colors = {                   -- add/modify theme and palette colors
        --palette = {},
        --theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    --},
    --theme = "wave",              -- Load "wave" theme when 'background' option is not set
    --background = {               -- map the value of 'background' option to a theme
        --dark = "wave",           -- try "dragon" !
        --light = "lotus"
    --},
    --compile = false,   -- enable compiling the colorscheme
    --undercurl = true, -- enable undercurls
    --commentStyle = { italic = false },
    --functionStyle = { italic = false },
    --keywordStyle = { italic = false },
    --typeStyle = { italic = false },
    --statementStyle = { italic = false },
    --overrides = function(colors)
      --return {
        ---- Assign a static color to strings
        --String = { fg = colors.palette.carpYellow, italic = false },
        ---- theme colors will update dynamically when you change theme!
        --SomePluginHl = { fg = colors.theme.syn.type, bold = true },
        --Italic = { italic = false },
        --Special = { italic = false },
        --["@variable.builtin"] = { italic = false }
      --}
    --end,
--})

-- setup must be called before loading
--vim.cmd("colorscheme kanagawa")
--
--
--
local dracula = require("dracula")
dracula.setup({
  -- customize dracula color palette
  colors = {
    bg = "#282A36",
    fg = "#F8F8F2",
    selection = "#44475A",
    comment = "#6272A4",
    red = "#FF5555",
    orange = "#FFB86C",
    yellow = "#F1FA8C",
    green = "#50fa7b",
    purple = "#BD93F9",
    cyan = "#8BE9FD",
    pink = "#FF79C6",
    bright_red = "#FF6E6E",
    bright_green = "#69FF94",
    bright_yellow = "#FFFFA5",
    bright_blue = "#D6ACFF",
    bright_magenta = "#FF92DF",
    bright_cyan = "#A4FFFF",
    bright_white = "#FFFFFF",
    menu = "#21222C",
    visual = "#3E4452",
    gutter_fg = "#4B5263",
    nontext = "#3B4048",
    white = "#ABB2BF",
    black = "#191A21",
  },
  -- show the '~' characters after the end of buffers
  show_end_of_buffer = true, -- default false
  -- use transparent background
  transparent_bg = true, -- default false
  -- set custom lualine background color
  lualine_bg_color = "#44475a", -- default nil
  -- set italic comment
  italic_comment = false, -- default false
  -- overrides the default highlights with table see `:h synIDattr`
  overrides = {},
  -- You can use overrides as table like this
  -- overrides = {
  --   NonText = { fg = "white" }, -- set NonText fg to white
  --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
  --   Nothing = {} -- clear highlight of Nothing
  -- },
  -- Or you can also use it like a function to get color from theme
   overrides = function (colors)
     return {
      --NonText = { fg = colors.white }, -- set NonText fg to white of theme
      Special = { fg = colors.green, italic = false },
      SpecialComment = { fg = colors.comment, italic = false },
      Todo = { fg = colors.purple, bold = true, italic = false, },
      ['@type.builtin'] = { fg = colors.cyan, italic = false, },
      ['@text.emphasis'] = { fg = colors.yellow, italic = false, }, -- italic
      ['@text.uri'] = { fg = colors.yellow, italic = false, }, -- urls
      htmlItalic = { fg = colors.purple, italic = false, },
      BufferInactive = { fg = colors.comment, bg = colors.black, italic = false },
      BufferInactiveIndex = { fg = colors.nontext, bg = colors.black, italic = false },
      BufferInactiveMod = { fg = colors.yellow, bg = colors.black, italic = false },
      BufferInactiveSign = { fg = colors.nontext, bg = colors.black, italic = false },
      AlphaFooter = { fg = colors.purple, italic = false },

     }
   end,
})

vim.cmd[[colorscheme dracula-soft]]

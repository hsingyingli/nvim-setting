require('aaron.base')
require('aaron.highlights')
require('aaron.maps')
require('aaron.plugins')


local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('aaron.macos')
end

if is_win then
  require('aaron.windows')
end

vim.cmd("runtime ./multi-cursor.vim")

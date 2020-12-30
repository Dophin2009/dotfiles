local U = require('util')

local gitsigns = U.require('gitsigns')
if gitsigns ~= nil then
  gitsigns.setup()
end

-- luacheck: globals vim
-- Set global variables for XDG dirs
local getenv = function(var, def)
    local env = os.getenv(var)
    return env and env or def
end

local g = vim.g
g.nvim_config = getenv('XDG_CONFIG_HOME', '~/.config') .. '/nvim'
g.nvim_data = getenv('XDG_DATA_HOME', '~/.local/share') .. '/nvim'
g.nvim_cache = getenv('XDG_CACHE_HOME', '~/.cache') .. '/nvim'

-- Load global editor settings
require 'global'

-- Load plugins
require 'plugins'

-- Load keybindings
require 'bindings'

-- Load theme
require 'theme'

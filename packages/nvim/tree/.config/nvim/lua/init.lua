-- Set global variables for XDG dirs
local getenv = function(var, def)
    local env = os.getenv(var)
    return env and env or def
end

local config_home = getenv('XDG_CONFIG_HOME', '~/.config')
local data_home = getenv('XDG_DATA_HOME', '~/.local/share')
local cache_home = getenv('XDG_CACHE_HOME', '~/.cache')

local g = vim.g
g.nvim_config = config_home .. '/nvim'
g_nvim_data = data_home .. '/nvim'
g.nvim_cache = cache_home .. '/nvim'

-- Load global editor settings
require 'global'

-- Load plugins
require 'plugins'
-- Load lsp configuration
require 'lsp'

-- Load keybindings
require 'bindings'

-- Load theme
require 'theme'

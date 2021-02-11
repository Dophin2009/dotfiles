local U = require('util')
local completion = U.require('completion')

local g = vim.g

g.completion_auto_change_source = 1

-- Enable snippet support
-- g.completion_enable_snippet = 'snippets.nvim'

-- Selection method
g.completion_matching_strategy_list = {'exact', 'substring', 'fuzzy'}
g.completion_matching_smart_case = 1

-- Timer adjustment
g.completion_timer_cycle = 200

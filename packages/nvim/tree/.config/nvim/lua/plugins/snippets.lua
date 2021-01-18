local U = require('util')

local snippets = require 'snippets'
local SU = require 'snippets.utils'

U.map('i', '<C-l>',
      [[ <cmd>lua return require('snippets').expand_or_advance(1)<CR> ]])
U.map('i', '<C-j>',
      [[ <cmd>lua return require('snippets').expand_or_advance(-1)<CR> ]])

snippets.snippets = {
    _global = {todo = 'TODO: $0'},
    -- lua snippets
    lua = {
        -- Require statment
        req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']],
        -- Function declaration
        func = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
        -- Local variable
        ["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]],
        ["for"] = SU.match_indentation [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
  $0
end]]
    }
}

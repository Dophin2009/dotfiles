local snippets = require 'snippets'
local SU = require 'snippets.utils'

snippets.use_suggested_mappings()

snippets.snippets = {
    _global = {todo = 'TODO: $0'},
    lua = {
        req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']],
        func = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
        ["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]],
        -- Match the indentation of the current line for newlines.
        ["for"] = SU.match_indentation [[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
  $0
end]]
    }
}

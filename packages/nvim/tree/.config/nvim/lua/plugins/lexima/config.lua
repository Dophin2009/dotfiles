-- luacheck: globals vim
local add_rule = vim.fn['lexima#add_rule']

add_rule({char = '$', input_after = '$', filetype = 'tex'})
add_rule({char = '$', at = [[\%#\$]], leave = 1, filetype = 'tex'})
add_rule({char = '<BS>', at = [[\$\%#\$]], delete = 1, filetype = 'tex'})

add_rule({char = '[', at = [[\\\%#]], input_after = '\\]', filetype = 'tex'})

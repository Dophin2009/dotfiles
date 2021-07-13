-- luacheck: globals vim
local lint = require 'lint'

local function register(names)
    if type(names) == "table" then
        for _, name in ipairs(names) do register(name) end
    else
        local ok, linter = pcall(require, 'plugins.lint.' .. names)
        if ok then rawset(lint.linters, names, linter) end
    end
end

local use = function(t)
    for _, linters in pairs(t) do register(linters) end

    lint.linters_by_ft = t
end

-- Register linters and autocmd
vim.api.nvim_command [[aug Lint]]
vim.api
    .nvim_command [[au BufReadPost,TextChanged,TextChangedI <buffer> lua require('lint').try_lint()]]
vim.api.nvim_command [[aug END]]

-- Define linters
use {lua = {'luacheck'}, sh = {'shellcheck'}, pandoc = {'vale'}}

local U = require('util')
local completion = U.require('completion')

local g = vim.g

if completion ~= nil then
    -- vimtex completion source
    local vimtex = {}

    function vimtex.getCompletionItems(prefix)
        -- define your total completion items
        local items = vim.api.nvim_call_function('vimtex#complete#omnifunc',
                                                 {0, prefix})
        return items
    end
    vimtex.complete_item = {item = vimtex.getCompletionItems}
    completion.addCompletionSource('vimtex', vimtex.complete_item)

    g.completion_matching_smart_case = 1
    g.completion_chain_complete_list = {
        {complete_items = {'lsp', 'snippet', 'path'}}
    }
end

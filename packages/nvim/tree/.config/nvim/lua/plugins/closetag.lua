local g = vim.g

g.closetag_filetypes =
    'html,xhtml,phtml,html.handlebars,javascriptreact,typescriptreact'

local regions = {}
regions['typescript.tsx'] = 'jsxRegion,tsxRegion'
regions['javascript.jsx'] = 'jsxRegion'
g.closetag_regions = regions

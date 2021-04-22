-- luacheck: globals vim
local U = require('util')
local nmap = U.nmap

-- Goto definition
nmap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {silent = true})

-- Goto implementation
nmap('gD', '<cmd>lua vim.lsp.buf.implementation()<CR>', {silent = true})

-- Goto type definition
nmap('gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {silent = true})

-- Signature help
nmap('gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {silent = true})

-- Document symbol help
nmap('g0', '<cmd>lua vim.lsp.buf.document_symbol()<CR>',
     {silent = true, noremap = false})

-- Workspace symbol help
nmap('gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>',
     {silent = true, noremap = false})

-- Show hover information
nmap("gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {silent = true})

-- Goto references
nmap("gr", "<cmd>lua vim.lsp.buf.references()<CR>",
     {silent = true, noremap = false})

-- Rename symbol
nmap("gR", "<cmd>lua vim.lsp.buf.rename()<CR>", {silent = true})

-- Select code action
nmap('gc', '<cmd>lua vim.lsp.buf.code_action()<CR>',
     {silent = true, noremap = false})

-- Goto next/previous diagnostic
nmap('gN', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {silent = true})
nmap('gn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {silent = true})

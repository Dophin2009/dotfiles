local g, o, wo, bo = vim.g, vim.o, vim.wo, vim.bo
local cmd, fn = vim.cmd, vim.fn

-- Python paths
g.python_host_prog = '/usr/bin/python2'
g.python3_host_prog = '/usr/bin/python3'

--
-- Editor Defaults
--

-- Enable syntax and indent
cmd [[syntax on]]
cmd [[filetype plugin indent on]]

-- Map leader
g.mapleader = '\\'

-- Keep buffers around
o.hidden = true
-- Avoid hit-enter messages
o.shortmess = o.shortmess .. 'c'
-- Updatetime for CursorHold
o.updatetime = 800
-- Always 10 lines below cursor
o.scrolloff = 10

-- Ignore case in search
o.ignorecase = true
-- Unless search with uppercase
o.smartcase = true

-- Show signcolumns
wo.signcolumn = 'yes'
-- Show line numbers
wo.number = true
wo.relativenumber = true
-- Show cursorline
wo.cursorline = true
-- No softwrap
wo.wrap = false

-- Tabs (space tabs)
o.expandtab = true
o.smarttab = true
o.autoindent = true
o.cindent = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2

-- Completion
o.completeopt = 'menuone,noinsert,noselect'

-- Undo
bo.undofile = true
vim.api.nvim_exec([[
  let &undodir=g:nvim_cache . '/undo'
]], true)

-- No local .vimrc files
o.exrc = false
o.secure = true

-- Auto-switch current working directory
vim.api.nvim_exec([[ autocmd BufEnter * lcd %:p:h ]], true)

-- Enable termguicolors
-- Sequences for RGB colors
o.termguicolors = true
vim.api.nvim_command([[
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
]])

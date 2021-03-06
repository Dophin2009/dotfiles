-- luacheck: globals vim
local U = require 'util'
local nmap = function(lhs, rhs) U.bind.nmap(lhs, rhs, {noremap = true}) end

local cmd = vim.cmd

local telescope = require 'telescope'
telescope.setup {}

-- Picker picker
cmd [[ command Pickers :lua require('telescope.builtin').builtin() ]]

--
-- File pickers
--

-- File picker
-- luacheck: no max_line_length
cmd [[ command Files :lua require('telescope.builtin').find_files({find_command = {'rg', '--ignore', '--hidden', '--files', '--follow', '-g!.git'}}) ]]
nmap('<C-p>', "<cmd>Files<CR>")

-- Git files picker
cmd [[ command GitFiles :lua require('telescope.builtin').git_files() ]]
cmd [[ cnoreabbrev GF GitFiles ]]
nmap('<C-p>', "<cmd>Files<CR>")

-- Recent files picker
cmd [[ command RecentFiles :lua require('telescope.builtin').oldfiles() ]]
nmap('<leader>ff', "<cmd>RecentFiles<CR>")

-- Use ripgrep to search
cmd [[ command Rg :lua require('telescope.builtin').live_grep() ]]
nmap('<leader>fg', "<cmd>Rg<CR>")

-- Fuzzy find in current buffer
cmd [[ command Rgh :lua require('telescope.builtin').live_grep() ]]
nmap('<leader>fh', "<cmd>Rgh<CR>")

--
-- Vim pickers
--

-- Buffer picker
cmd [[ command Buffers :lua require('telescope.builtin').buffers() ]]
nmap('<leader>fb', "<cmd>Buffers<CR>")

-- Mark picker
cmd [[ command Marks :lua require('telescope.builtin').marks() ]]
nmap('<leader>fm', "<cmd>Marks<CR>")

-- ctags picker
cmd [[ command Ctags :lua require('telescope.builtin').tags() ]]

-- Quickfix picker
cmd [[ command Quickfixes :lua require('telescope.builtin').quickfix() ]]

-- Location list picker
cmd [[ command Loclist :lua require('telescope.builtin').loclist() ]]

-- Registers picker
cmd [[ command Registers :lua require('telescope.builtin').registers() ]]

-- Command picker
cmd [[ command Commands :lua require('telescope.builtin').commands() ]]

-- Command history picker
cmd [[ command CommandHistory :lua require('telescope.builtin').command_history() ]]

-- Help tag picker
cmd [[ command HelpTags :lua require('telescope.builtin').help_tags() ]]

-- Man page picker
cmd [[ command ManPages :lua require('telescope.builtin').man_pages() ]]

-- Colorschemes picker
cmd [[ command Colorschemes :lua require('telescope.builtin').colorscheme() ]]

-- Keymaps picker
cmd [[ command Keymaps :lua require('telescope.builtin').keymaps() ]]

--
-- Git pickers
--

-- Commits picker
cmd [[ command Commits :lua require('telescope.builtin').git_commits() ]]

-- Commits picker for this buffer
cmd [[ command BCommits :lua require('telescope.builtin').git_bcommits() ]]

--
-- LSP pickers
--

-- Goto definition picker
cmd [[ command LSPGotoDefinition :lua require('telescope.builtin').lsp_definitions() ]]

-- Diagnostics pickers
cmd [[ command LSPDiagnostics :lua require('telescope.builtin').lsp_document_diagnostics() ]]
cmd [[ command LSPWDiagnostics :lua require('telescope.builtin').lsp_workspace_diagnostics() ]]

-- References picker
cmd [[ command LSPReferences :lua require('telescope.builtin').lsp_references() ]]

-- Document symbols picker
cmd [[ command LSPDSymbols :lua require('telescope.builtin').lsp_document_symbols() ]]

-- Workspace symbols picker
cmd [[ command LSPWSymbols :lua require('telescope.builtin').lsp_workspace_symbols() ]]

-- Code actions picker
cmd [[ command LSPActions :lua require('telescope.builtin').lsp_code_actions() ]]

-- Range code actions picker
cmd [[ command LSPRangeActions :lua require('telescope.builtin').lsp_range_code_actions() ]]

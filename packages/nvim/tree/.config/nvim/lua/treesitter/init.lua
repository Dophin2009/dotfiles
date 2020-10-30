local treesitter = require('nvim-treesitter.configs')

if not(treesitter == nil) then
  treesitter.setup {
    ensure_installed = 'maintained',
    highlight = {
      enable = true,
      disable = { 'rust' },
    },
  }
end

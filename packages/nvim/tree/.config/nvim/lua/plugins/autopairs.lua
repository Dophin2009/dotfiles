-- luacheck: globals vim
local autopairs = require 'nvim-autopairs'
local Rule = require 'nvim-autopairs.rule'

autopairs.setup {check_ts = true}

autopairs.add_rules({
    Rule('(* ', ' *', {'ocaml'}), Rule('begin ', ' end', {'ocaml'})
})

-- luacheck: globals vim
local autopairs = require 'nvim-autopairs'
local Rule = require 'nvim-autopairs.rule'

autopairs.setup {check_ts = true}

-- OCaml rules
autopairs.add_rules({
    Rule('(* ', ' *', {'ocaml'}), Rule('begin ', 'end', {'ocaml'}),
    Rule('struct ', 'end', {'ocaml'}), Rule('sig ', 'end', {'ocaml'})
})

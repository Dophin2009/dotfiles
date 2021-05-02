local lib = require('lib')
local lfs = require('lfs')

pkg.name = 'zsh'
pkg.dependencies:extend('../sh')

local localpkg = 'local.zsh'
if lfs.attributes(localpkg) then
    for file in lfs.dir(localpkg) do
        if file ~= '.' and file ~= '..' then
            local f = localpkg .. '/' .. file
            local attr = lfs.attributes(f)
            pkg.files.extra:extend({
                src = f,
                dest = '.config/zsh/load/local/' .. file
            })
        end
    end
end

-- Load local file if it exists
lib.require_opt('local')

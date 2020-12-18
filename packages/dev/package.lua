require('lib')
local lfs = require('lfs')

pkg.name = 'dev'

pkg.files.trees:clear()
for file in lfs.dir('.') do
    if file ~= '.' and file ~= '..' and file ~= 'lib' then
        local attr = lfs.attributes(file)
        if attr.mode == 'directory' then pkg.dependencies:extend(file) end
    end
end

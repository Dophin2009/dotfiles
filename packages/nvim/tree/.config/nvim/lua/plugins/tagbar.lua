local U = require('util')
local g = vim.g

-- More compact
g.tagbar_compact = 1
g.tagbar_indent = 1

-- Set to be wider
g.tagbar_width = 60

-- Show line numbers
g.tagbar_show_linenumbers = 1

-- Autoclose and autofocus
g.tagbar_autoclose = 1
g.tagbar_autofocus = 1

-- Toggle tagbar
U.nmap('<leader>y', '<cmd>TagbarToggle<CR>', {silent = true})

--
-- Language configurations
--

-- Go
g.tagbar_type_go = {
    ctagstype = 'go',
    kinds = {
        'p=package', 'i:imports:1', 'c:constants', 'v:variables', 't:types',
        'n:interfaces', 'w:fields', 'e:embedded', 'm:methods', 'r:constructor',
        'f:functions'
    },
    sro = '.',
    kind2scope = {t = 'ctype', n = 'ntype'},
    scope2kind = {ctype = 't', ntype = 'n'},
    ctagsbin = 'gotags',
    ctagsargs = '-sort -silent'
}

-- JSON
g.tagbar_type_json = {
    ctagstype = 'json',
    kinds = {
        'o=objects', 'a=arrays', 'n=numbers', 's=strings', 'b=booleans',
        'z=nulls'
    },
    sro = '.',
    scope2kind = {
        object = 'o',
        array = 'a',
        number = 'n',
        string = 's',
        boolean = 'b',
        null = 'z'
    },
    kind2scope = {
        o = 'object',
        a = 'array',
        n = 'number',
        s = 'string',
        b = 'boolean',
        z = 'null'
    },
    sort = 0
}

-- Makefile
g.tagbar_type_make = {
    deffile = g.nvim_config .. '/ctags/make.ctags',
    kinds = {'m:macros', 't:targets'}
}

-- Markdown
g.tagbar_type_markdown = {
    ctagstype = 'markdown',
    ctagsbin = g.nvim_config .. '/scripts/markdown2ctags.py',
    ctagsargs = '-f - --sort=yes --sro=»',
    kinds = {'s:sections', 'i:images'},
    sro = '»',
    kind2scope = {s = 'section'},
    sort = 0
}

-- Pandoc
g.tagbar_type_pandoc = g.tagbar_type_markdown

-- R
g.tagbar_type_r = {
    ctagstype = 'r',
    deffile = g.nvim_config .. '/ctags/r.ctags',
    kinds = {'f:Functions', 'g:GlobalVariables', 'v:FunctionVariables'}
}

-- Rmarkdown
g.tagbar_type_rmd = {
    ctagstype = 'rmd',
    kinds = {'h:header', 'c:chunk', 'f:function', 'v:variable'},
    sro = '&&&',
    kind2scope = {h = 'header', c = 'chunk'},
    sort = 0,
    ctagsbin = g.nvim_config .. 'scripts/rmdtags.py',
    ctagsargs = ''
}

-- Rust
g.tagbar_type_rust = {
    ctagsbin = 'ctags',
    ctagstype = 'rust',
    kinds = {
        'n:modules', 's:structures:1', 'i:interfaces', 'c:implementations',
        'f:functions:1', 'g:enumerations:1', 't:type aliases:1:0',
        'v:constants:1:0', 'M:macros:1', 'm:fields:1:0', 'e:enum variants:1:0',
        'P:methods:1'
    },
    sro = '::',
    kind2scope = {
        n = 'module',
        s = 'struct',
        i = 'interface',
        c = 'implementation',
        f = 'function',
        g = 'enum',
        t = 'typedef',
        v = 'variable',
        M = 'macro',
        m = 'field',
        e = 'enumerator',
        P = 'method'
    }
}

-- SCSS
g.tagbar_type_scss = {
    deffile = g.nvim_config .. '/ctags/scss.ctags',
    kinds = {'c:classes', 'i:ids', 't:tags', 'm:media', 'v:variables'}
}

-- Typescript
-- npm install --global git+https://github.com/Perlence/tstags.git
g.tagbar_type_typescript = {
    ctagsbin = 'tstags',
    ctagsargs = '-f-',
    kinds = {
        'e:enums:0:1', 'f:function:0:1', 't:typealias:0:1', 'M:Module:0:1',
        'I:import:0:1', 'i:interface:0:1', 'C:class:0:1', 'm:method:0:1',
        'p:property:0:1', 'v:variable:0:1', 'c:const:0:1'
    },
    sort = 0
}

-- Typescript React
g.tagbar_type_typescriptreact = g.tagbar_type_typescript

-- YAML
g.tagbar_type_yaml = {
    ctagstype = 'yaml',
    deffile = g.nvim_config .. '/ctags/yaml.ctags',
    kinds = {'a:anchors', 's:section', 'e:entry'},
    sro = '.',
    scope2kind = {section = 's', entry = 'e'},
    kind2scope = {s = 'section', e = 'entry'},
    sort = 0
}

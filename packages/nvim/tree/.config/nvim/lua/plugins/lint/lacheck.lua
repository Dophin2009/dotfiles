-- luacheck: globals vim
local pattern = '[^:]+, line (%d+): (.*)'

return {
    cmd = 'lacheck',
    stdin = false,
    parser = function(output, _)
        local result = vim.fn.split(output, "\n")
        local diagnostics = {}

        for _, line in ipairs(result) do
            local lineno, message = string.match(line, pattern)

            lineno = tonumber(lineno or 1) - 1
            table.insert(diagnostics, {
                source = 'luacheck',
                range = {
                    ['start'] = {line = lineno, character = 0},
                    ['end'] = {line = lineno, character = 0}
                },
                message = message,
                severity = vim.lsp.protocol.DiagnosticSeverity.Warning
            })
        end
        return diagnostics
    end
}

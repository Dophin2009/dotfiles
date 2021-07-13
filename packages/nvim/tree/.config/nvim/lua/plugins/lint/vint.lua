local pattern = '[^:]+:(%d+):(%d+): (.*)'

return {
    cmd = 'vint',
    stdin = true,
    args = {'-'},
    parser = function(output, _)
        local result = vim.fn.split(output, "\n")
        local diagnostics = {}

        for _, message in ipairs(result) do
            local line, off, message = string.match(message, pattern)
            line = tonumber(line or 1) - 1
            off = tonumber(off or 1) - 1

            table.insert(diagnostics, {
                source = 'vint',
                range = {
                    ['start'] = {line = line, character = off},
                    ['end'] = {line = line, character = off + 1}
                },
                message = message,
                severity = vim.lsp.protocol.DiagnosticSeverity.Error
            })
        end

        return diagnostics
    end
}

local bin = './node_modules/.bin/eslint'

return {
    lintCommand = bin .. ' -f visualstudio --stdin',
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f(%l,%c): error %m", "%f(%l,%c): warning %m"}
}

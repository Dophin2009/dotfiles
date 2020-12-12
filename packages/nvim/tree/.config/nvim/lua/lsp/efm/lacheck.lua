return {
  lintCommand = 'lacheck ${INPUT} | grep --invert-match "^\\*\\*"',
  lintFormats = {'"%f", line %l: -> %m', '"%f", line %l: <- %m'}
}

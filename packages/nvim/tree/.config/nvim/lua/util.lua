local U = {}

U.require = function(pkg)
  local status, module = pcall(require, pkg)
  return status and module or nil
end

return U

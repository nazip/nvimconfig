local M = {}

local function exists(filename)

   local isPresent = true
   -- Opens a file
   f = io.open(filename)

   -- if file is not present, f will be nil
   if not f then
      isPresent = false
   else
      -- close the file  
      f:close()
   end

   -- return status
   return isPresent
end

function M.runPrg()
  if exists('main.go') then
      return ':!go run main.go<CR>'
  end

  return ':!go run cmd/main.go <CR>'
end

return M

local function removeInterpreters()
  local whitelist = {
    luadeb = true,
    love2d = true
  }
  
  for interpreter in pairs(ide.interpreters) do
    if not whitelist[interpreter] then
      ide:RemoveInterpreter(interpreter)
    end    
  end
end

return {
  name = "Da Vinci Environment plugin",
  description = "Sets up ZeroBrane Studio for use in the classes taught at the Da Vinci College in Dordrecht, The Netherlands.",
  author = "William Willing",
  version = 1,
  
  onRegister = function (self)
    removeInterpreters()
  end
}
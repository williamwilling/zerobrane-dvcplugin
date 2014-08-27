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

local function disableOutputText()
  local _displayOutputLn = DisplayOutputLn
  DisplayOutputLn = function(str, ...)
    if str ~= "" then
      _displayOutputLn(str, ...)
    end
  end

  local _tr = TR
  TR = function(str)
    local altered = {
      ["Program starting as '%s'."] = "",
      ["Program '%s' started in '%s' (pid: %d)."] = ""
    }

    return altered[str] or _tr(str)
  end
end

return {
  name = "Da Vinci Environment plugin",
  description = "Sets up ZeroBrane Studio for use in the classes taught at the Da Vinci College in Dordrecht, The Netherlands.",
  author = "William Willing",
  version = 1,
  
  onRegister = function (self)
    removeInterpreters()    -- Only show the interpreters we actually use.
    disableOutputText()     -- When you run your program, you should see only the text your program generates and not some preamble.
  end
}
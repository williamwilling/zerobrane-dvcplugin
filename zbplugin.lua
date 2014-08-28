return {
  name = "Da Vinci Environment plugin",
  description = "Sets up ZeroBrane Studio for use in the classes taught at the Da Vinci College in Dordrecht, The Netherlands.",
  author = "William Willing",
  version = 1,

  install = function ()
    local remotePath = "http://zerobranestore.blob.core.windows.net/davinci/"
    
    download(remotePath .. "davinci.lua", idePath .. "packages/davinci.lua")
  end
}
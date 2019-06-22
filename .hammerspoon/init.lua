spaces = require("hs._asm.undocumented.spaces")

------------
-- ALERTS --
------------

hs.window.animationDuration = 0 -- disable animations
hs.alert.defaultStyle["fillColor"] = {
  white = 0,
  alpha = .75
}
hs.alert.defaultStyle["strokeColor"] = {
  alpha = 0
}
hs.alert.defaultStyle["radius"] = 4
hs.alert.defaultStyle["textColor"] = {
  red = 249/255,
  green = 252/255,
  blue = 255/255
}
hs.alert.defaultStyle["textSize"] = 50
hs.alert.defaultStyle["atScreenEdge"] = 1


-----------
-- UTILS --
-----------

-- Reload Config
hs.hotkey.bind({"cmd", "ctrl"}, "R", function()
  hs.reload()
end)

-- Clear Console
hs.hotkey.bind({"cmd", "ctrl"}, "K", function()
  hs.console.clearConsole()
end)


-------------
-- WINDOWS --
-------------

-- Move windows to space hotkeys
hs.hotkey.bind({"option"}, "`", function()
  
end)
hs.hotkey.bind({"option"}, "1", function()
	
end)
hs.hotkey.bind({"option"}, "2", function()
  
end)
hs.hotkey.bind({"option"}, "3", function()
  
end)
hs.hotkey.bind({"option"}, "4", function()
  
end)

function setFull()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  
  f.w = max.w
  f.h = max.h
  
  f.x = 0
  f.y = 0
  
  win:setFrame(f)
end

hs.hotkey.bind({"cmd", "ctrl"}, "z", setFull)

-- Set window to right half of screen
function setRight()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  
  f.w = max.w / 2
  f.h = max.h
  
  f.x = max.w / 2
  f.y = 0

  win:setFrame(f)
end

-- Bind hotkey to setRight
hs.hotkey.bind({"cmd", "ctrl"}, "s", setRight)

function setLeft()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  
  f.w = max.w / 2
  f.h = max.h
  
  f.x = 0
  f.y = 0
  
  win:setFrame(f)
end

hs.hotkey.bind({"cmd", "ctrl"}, "a", setLeft)

-- move current window to the space sp
function MoveWindowToSpace(sp)
    local win = hs.window.focusedWindow()      -- current window
    local uuid = win:screen():spacesUUID()     -- uuid for current screen
    local spaceID = spaces.layout()[uuid][sp]  -- internal index for sp
    spaces.moveWindowToSpace(win:id(), spaceID) -- move window to new space
    spaces.changeToSpace(spaceID, false)              -- follow window to new space
    currentSpaceID = spaceID
end

-- Feedback for config load
hs.alert.show("Config loaded")
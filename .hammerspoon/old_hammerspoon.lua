-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
--   hs.alert.show("Hello World!")
-- end)

-- hs.hotkey.bind({"cmd"}, "W", function()
--   hs.alert.show("Hello World!")
-- end)

-- hs.hotkey.bind({}, "Q", function()
--   hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
-- end)


-- -- Example of window movement (in this case up and to the right)
-- hs.hotkey.bind({"cmd", "alt", "ctrl"}, "U", function()
--   local win = hs.window.focusedWindow()
--   local f = win:frame()

--   f.x = f.x + 10
--   f.y = f.y - 10
--   win:setFrame(f)
-- end)
-- local scriptTest = require("/Users/taylor/.hammerspoon/Spoons/Calendar.spoon/init.lua")

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



function round(num)
	return math.floor(num+0.5)
end


function getDenomVert(win_frame, screen_frame)
	local frac = win_frame.h / screen_frame.h
	local recip = 1 / frac
	return round(recip)
end

function getDenomHoriz(win_frame, screen_frame)
	local frac = win_frame.w / screen_frame.w
	local recip = 1 / frac
	return round(recip)
end

function getGridY(win_frame, size)
	local val = win_frame.y / size
	return round(val)
end

function getGridX(win_frame, size)
	local val = win_frame.x / size
	return round(val)
end

-- Decrease vertical window size 
function decrVertWinSize()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  local denom = getDenomVert(f, max)
  local grid_y = getGridY(f, max.h / denom)

  denom = denom + 1

  local new_block_size = max.h / denom

  f.y = new_block_size * grid_y
  f.h = max.h / denom
  
  win:setFrame(f) 
end

-- Increase vertical window size
function incrVertWinSize()  
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  local denom = getDenomVert(f, max)
  local grid_y = getGridY(f, max.h / denom)

  if denom > 1 then
  	denom = denom - 1
  end

  local new_block_size = max.h / denom

  -- check if frame goes off screen
  local try_y = new_block_size * grid_y
  if try_y + f.h > max.h then
  	f.y = 22 + new_block_size * (grid_y - 1)
  else
  	f.y = 22 + new_block_size * grid_y
  end
  
  f.h = max.h / denom

  win:setFrame(f)
end

-- Increase horizontal window size
function incrHorizWinSize()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  
  local denom = getDenomHoriz(f, max)
  local grid_x = getGridX(f, max.w / denom)

  if denom > 1 then
  	denom = denom - 1 
  end

  local new_block_size = max.w / denom
  
  -- check if frame goes off screen
  local try_x = new_block_size * grid_x
  if try_x + f.w > max.w then
  	f.x = new_block_size * (grid_x - 1)
  else
  	f.x = new_block_size * grid_x
  end
  
  f.w = max.w / denom

  win:setFrame(f)
end

-- Decrease horizontal window size
function decrHorizWinSize()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  
  local denom = getDenomHoriz(f, max)
  local grid_x = getGridX(f, max.w / denom)

  denom = denom + 1 

  local new_block_size = max.w / denom

  f.x = new_block_size * grid_x
  f.w = max.w / denom
  
  win:setFrame(f)
end

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




-- Move window up on the screen
function moveWinUp()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  local denom = getDenomVert(f, max)
  local block_size_vert = max.h / denom
  
  local grid_y = getGridY(f, block_size_vert)
  if grid_y > 0 then
  	grid_y = grid_y - 1
  end
  
  f.y = 22 + (block_size_vert * grid_y)
  
  win:setFrame(f) 
end

-- Move window 5 pixels up on the screen
function inchWinUp()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if f.y > 22 + 9 then
    f.y = f.y - 10
  end
  win:setFrame(f) 
end

-- Move window down on the screen
function moveWinDown()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  
  local denom = getDenomVert(f, max)
  local block_size_vert = max.h / denom

  local grid_y = getGridY(f, block_size_vert)
  if grid_y < denom - 1 then
  	grid_y = grid_y + 1
  end

  f.y = 22 + (block_size_vert * grid_y)
  
  win:setFrame(f)
end

-- Move window 5 pixels up on the screen
function inchWinDown()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if f.y + f.h < 1050 - 9 then
    f.y = f.y + 10
  end
  win:setFrame(f) 
end

-- Move window right on the screen
function moveWinRight()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
 
  local denom = getDenomHoriz(f, max) 
  local block_size_horiz = max.w / denom
  
  local grid_x = getGridX(f, block_size_horiz)
  if grid_x < denom - 1 then
  	grid_x = grid_x + 1
  end

  f.x = (block_size_horiz * grid_x)
 
  win:setFrame(f) 
end

-- Move window 5 pixels up on the screen
function inchWinRight()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if f.x + f.w < 1680 - 9 then
    f.x = f.x + 10
  end
  win:setFrame(f) 
end

-- Move window left on the screen
function moveWinLeft()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  
  local denom = getDenomHoriz(f, max) 
  local block_size_horiz = max.w / denom
  
  local grid_x = getGridX(f, block_size_horiz)
  if grid_x > 0 then
  	grid_x = grid_x - 1
  end

  f.x = (block_size_horiz * grid_x)
  
  win:setFrame(f)
end

-- Move window 5 pixels up on the screen
function inchWinLeft()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if f.x > 0 + 10 then
    f.x = f.x - 10
  end
  win:setFrame(f) 
end

-- Checks if test_frame overlaps with focal frame
function overlaps(focal_frame, test_frame)
	local x1 = focal_frame.x
	local x2 = focal_frame.x + focal_frame.w
	local x3 = test_frame.x
	local x4 = test_frame.x + test_frame.w
	local y1 = focal_frame.y
	local y2 = focal_frame.y + focal_frame.h
	local y3 = test_frame.y
	local y4 = test_frame.y + test_frame.h

	if x3 >= x2 or y3 >= y2 or x1 >= x4 or y1 >= y4
	then
	  return false 
  else
    return true
	end
end

-- Bring forward all windows behind current window
-- No longer in use. Using Mac built-in (ctrl + <direction>)
hs.hotkey.bind({"cmd", "shift"}, "Up", function()
  
  -- window = hs.window:focusedWindow()
  -- window:sendToBack()
  local foc_win = hs.window.focusedWindow() 
  local f = foc_win:frame()
  local all_win = hs.window.allWindows()

  local ind = 1
  while all_win[ind] ~= nil do
    cur_win = all_win[ind]
    if (cur_win ~= foc_win)
    then
      if overlaps(f, cur_win:frame())
      then
    	  print(cur_win)
    	  cur_win:focus()
      end 
    end
    ind = ind + 1
  end
end)

local reading_windows = {first=nil, last=nil}
local writing_windows = {first=nil, last=nil}
local utility_windows = {first=nil, last=nil}


function buildWindows()
  all_w = hs.window.allWindows()
  i = 1
  while all_w[i] ~= nil do
    cur_w = all_w[i]
    if isWriting(cur_w) then
      writing_windows = add(writing_windows, cur_w) 
    elseif isUtility(cur_w) then
      utility_windows = add(utility_windows, cur_w)
    else
      reading_windows = add(reading_windows, cur_w)
    end
    i = i + 1
  end
end

function quickSendToBack(windows)
  local old_last = windows.last
  old_last.next = windows.first
  windows.first.prev = old_last
  windows.first = windows.first.next
  windows.last = windows.last.next
  windows.first.prev = nil
  windows.last.next = nil

  -- focus front window
  windows.first.window:focus()
end
function focNorth()
  hs.window.focusedWindow():focusWindowNorth(nil, true, true)
end
function focSouth()
  hs.window.focusedWindow():focusWindowSouth(nil, true, true)
end
function focEast()
  hs.window.focusedWindow():focusWindowEast(nil, true, true)
end
function focWest()
  hs.window.focusedWindow():focusWindowWest(nil, true, true)
end
hs.hotkey.bind({"cmd","option"}, "up", focNorth)
hs.hotkey.bind({"cmd","option"}, "down", focSouth)
hs.hotkey.bind({"cmd","option"}, "right", focEast)
hs.hotkey.bind({"cmd","option"}, "left", focWest)


-- hs.canvas.drawingWrapper(true)

-- -- rect = hs.drawing.rectangle(hs.geometry.rect(0, 0, 200, 200))
-- -- rect:setFillColor({hex="#FFFFFF"})
-- -- rect:show()

-- rect = hs.drawing.text(hs.geometry.rect(0, 0, 200, 200), {
--   color={hex="#333333"},
--   backgroundColor={hex="#33333", alpha=1},
--   underlineColor=nil,
--   strikethroughColor=nil,
--   strokeColor=nil,
--   strokeWidth=0,
--   message="hello"
-- })
-- -- text:bringToFront()
-- -- text:setTextColor({hex="#000000"})

-- rect:show()



-- rect:orderBelow(text)




-----------------------
-- Move Mode (Start) --
-----------------------

k = hs.hotkey.modal.new('cmd', 'e') 
uuid = nil
function k:entered() 
	uuid = hs.alert.show('Move', 'indefinite')
end 
function k:exited()
  hs.alert.closeSpecific(uuid)
  uuid = nil
end 
k:bind('cmd', 'e', function() k:exit() end) 
k:bind( 'cmd', 'up', nil, decrVertWinSize, nil, nil )
k:bind( 'cmd', 'down', nil, incrVertWinSize, nil, nil )
k:bind( 'cmd', 'right', nil, incrHorizWinSize, nil, nil )
k:bind( 'cmd', 'left', nil, decrHorizWinSize, nil, nil )
k:bind( '', 'up', nil, nil, inchWinUp, nil )
k:bind( '', 'down', nil, nil, inchWinDown, nil )
k:bind( '', 'right', nil, nil, inchWinRight, nil )
k:bind( '', 'left', nil, nil, inchWinLeft, nil )

---------------------
-- Move Mode (End) --
---------------------

function isWriting(win)
  f = win:frame()
  return (f.x == 0) and (f.y == 22) and (f.w == 788) and (f.h == 1028) 
end

function isUtility(win)
  f = win:frame()
  return (f.x == 789) and (f.y == 22) and (f.w == 890) and (f.h == 293) 
end

function isReading(win)
  f = win:frame()
  return (f.x == 789) and (f.y == 316) and (f.w == 890) and (f.h == 734) 
end

writing_section = { x=0, y=22, w=788, h=1050-22 }
utility_section = { x=789, y=22, w=890, h=293 }
reading_section = { x=789, y=316, w=890, h=734 }
media_section = { x=789, y=316, w=890, h=734 }

local laptopScreen = "Color LCD"
local coding = {
    {nil,              "hmmmm", laptopScreen, nil, nil, reading_section},
    {"Sublime Text 2", nil, laptopScreen, nil, nil, writing_section},
    {"Google Chrome",  nil, laptopScreen, nil, nil, reading_section},
    {"Min",            nil, laptopScreen, nil, nil, reading_section},
    {"Spotify",  nil, laptopScreen, nil, nil, reading_section},
    {"iTerm2",         nil, laptopScreen, nil, nil, utility_section},
    {"Finder",         nil, laptopScreen, nil, nil, utility_section},
    {"Hammerspoon",    "Hammerspoon Console", laptopScreen, nil, nil, utility_section},
    {"Numi",           "Numi", laptopScreen, nil, nil, utility_section}
  }


hs.hotkey.bind({"cmd"}, "m", function()
  hs.drawing.disableScreenUpdates()
  hs.layout.apply(coding, function() 
      return (windowTitle == layoutWindow) or layoutWindow == 'hmmmm'
    end)
end)

-- {
--   reading = {coord={x=0,   y=22 }, w=792, h=697}
--   writing = {coord={x=792, y=22 }, w=888, h=506}
--   utility = {coord={x=0,   y=719}, w=792, h=332}
--   media   = {coord={x=792, y=528}, w=888, h=522}
-- }



writing_section = { x=0, y=22, w=788, h=1050-22 }
utility_section = { x=789, y=22, w=890, h=293 }
reading_section = { x=789, y=316, w=890, h=734 }
media_section = { x=789, y=316, w=890, h=734 }


local laptopScreen = "Color LCD"
local video = {
    {"Sublime Text 2", nil, laptopScreen, nil, nil, writing_section},
    {"Google Chrome",  nil, laptopScreen, nil, nil, reading_section},
    {"Spotify",        nil, laptopScreen, nil, nil, reading_section},
    {"iTerm2",         nil, laptopScreen, nil, nil, utility_section},
    {"Finder",         nil, laptopScreen, nil, nil, utility_section},
    {nil,              "Hammerspoon Console", laptopScreen, nil, nil, utility_section}
    

}

-- for i=1,#hs.window.allWindows(),1 do print(hs.window.allWindows()[i]) end
-- TODO: 
-- 1. make Mode and Layout and Section banners
-- 2. make way to see what windows were not covered by layout rules. Maybe make a
--    notification banner for "unncovered" apps



-- function fn()
-- 	print('change')
-- end







-- hs.hotkey.bind({"cmd"}, "T", function()
-- 	modal = hs.hotkey.modal.new({'cmd', 'ctrl'}, 'space', 'Move mode'):enter()

--   modal:bind({"cmd"}, "L", nil, print('hi'), nil, print('hi'))

--   modal:enter()
-- end)











-- Clear Console
-- hs.hotkey.bind({"cmd"}, "K", function()
--   hs.console.clearConsole()
-- end)

-- Reload Config
hs.hotkey.bind({"cmd", "shift"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")



function test(sp)
  print(sp)
end



-- watcher = hs.spaces.watcher.new(test)
-- table = spaces.layout()
-- test = {1,2,3}
-- print (#test)
-- print (#table)
-- print (allSpaces[1])
-- print (allSpaces[2])
-- print (allSpaces[3])
-- print (allSpaces[4])
-- print (allSpaces[5])
-- test(1)


local spaces = require("hs._asm.undocumented.spaces")

function getSpace(ind)
  print("okay1")
  rawSpaces = spaces.allSpaces()
  local out = {}
  for i,v in ipairs(rawSpaces) do
      out[i] = v
  end
  print("okay2")
  print(out[ind])
  return out[ind]
end


-- move current window to the space sp
function MoveWindowToSpace(sp)
    local win = hs.window.focusedWindow()      -- current window
    local uuid = win:screen():spacesUUID()     -- uuid for current screen
    local spaceID = spaces.layout()[uuid][sp]  -- internal index for sp
    spaces.moveWindowToSpace(win:id(), spaceID) -- move window to new space
    spaces.changeToSpace(spaceID)              -- follow window to new space
    currentSpaceID = spaceID
end

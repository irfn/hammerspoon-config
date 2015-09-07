-- Hammerspoon configuration, heavily influenced by sdegutis default configuration

-- init grid
hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 7
hs.grid.GRIDHEIGHT = 3

-- disable animation
hs.window.animationDuration = 0


-- hotkey mash
local ctrl_alt   = {"ctrl", "alt"}
local mash   = {"cmd", "alt", "ctrl"}
local ctrl_alt_shift = {"ctrl", "alt", "shift"}

--------------------------------------------------------------------------------

-- application help
local function open_help()
  help_str = "d - Dictionary, 1 - Terminal, 2 - Pathfinder, " ..
            "3 - Chrome, 4 - Dash, 5 - Trello, 6 - Quiver"        
  hs.alert.show(
   help_str, 2)
end
local function launchOrFocus (app)
    return function () hs.application.launchOrFocus(app) end
end


-- Launch applications
hs.hotkey.bind(mash, 'D', launchOrFocus("Dictionary"))
hs.hotkey.bind(mash, 't', launchOrFocus("iterm"))
hs.hotkey.bind(mash, 'e', launchOrFocus("Finder"))
hs.hotkey.bind(mash, 'c', launchOrFocus("Google Chrome"))
hs.hotkey.bind(mash, 's', launchOrFocus("Safari"))
hs.hotkey.bind(mash, 'h', launchOrFocus("HipChat"))
hs.hotkey.bind(mash, '.', launchOrFocus("WebStorm"))
hs.hotkey.bind(mash, '/', open_help)

-- global operations
hs.hotkey.bind(ctrl_alt, ';', function() hs.grid.snap(hs.window.focusedWindow()) end)
hs.hotkey.bind(ctrl_alt, "'", function() hs.fnutil.map(hs.window.visibleWindows(), hs.grid.snap) end)

-- adjust grid size
hs.hotkey.bind(ctrl_alt, '=', function() hs.grid.adjustWidth( 1) end)
hs.hotkey.bind(ctrl_alt, '-', function() hs.grid.adjustWidth(-1) end)
hs.hotkey.bind(ctrl_alt, ']', function() hs.grid.adjustHeight( 1) end)
hs.hotkey.bind(ctrl_alt, '[', function() hs.grid.adjustHeight(-1) end)

-- change focus
hs.hotkey.bind(ctrl_alt_shift, 'right', function() hs.window.focusedWindow():focusWindowWest() end)
hs.hotkey.bind(ctrl_alt_shift, 'left', function() hs.window.focusedWindow():focusWindowEast() end)
hs.hotkey.bind(ctrl_alt_shift, 'up', function() hs.window.focusedWindow():focusWindowNorth() end)
hs.hotkey.bind(ctrl_alt_shift, 'down', function() hs.window.focusedWindow():focusWindowSouth() end)

hs.hotkey.bind(ctrl_alt, 'M', hs.grid.maximizeWindow)

-- multi monitor
hs.hotkey.bind(ctrl_alt, 'right', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(ctrl_alt, 'left', hs.grid.pushWindowPrevScreen)

-- move windows
hs.hotkey.bind(mash, 'left', hs.grid.pushWindowLeft)
hs.hotkey.bind(mash, 'down', hs.grid.pushWindowDown)
hs.hotkey.bind(mash, 'up', hs.grid.pushWindowUp)
hs.hotkey.bind(mash, 'right', hs.grid.pushWindowRight)

-- resize windows
hs.hotkey.bind(ctrl_alt, 'Y', hs.grid.resizeWindowThinner)
hs.hotkey.bind(ctrl_alt, 'U', hs.grid.resizeWindowShorter)
hs.hotkey.bind(ctrl_alt, 'I', hs.grid.resizeWindowTaller)
hs.hotkey.bind(ctrl_alt, 'O', hs.grid.resizeWindowWider)

-- Window Hints
hs.hotkey.bind(ctrl_alt, '.', hs.hints.windowHints)


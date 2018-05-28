-- HANDLE SCROLLING

local deferred = false

overrideRightMouseDown = hs.eventtap.new({ hs.eventtap.event.types.otherMouseDown }, function(e)
    deferred = true
    return true
end)

overrideRightMouseUp = hs.eventtap.new({ hs.eventtap.event.types.otherMouseUp }, function(e)
    if (deferred) then
        overrideRightMouseDown:stop()
        overrideRightMouseUp:stop()
        hs.eventtap.otherClick(e:location())
        overrideRightMouseDown:start()
        overrideRightMouseUp:start()
        return true
    end
    return false
end)


local oldmousepos = {}
-- negative multiplier makes mouse work like traditional scrollwheel
local scrollmult = 3
dragRightToScroll = hs.eventtap.new({ hs.eventtap.event.types.otherMouseDragged }, function(e)
    deferred = false
    oldmousepos = hs.mouse.getAbsolutePosition()    
    local dx = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaX'])
    local dy = e:getProperty(hs.eventtap.event.properties['mouseEventDeltaY'])
    local scroll = hs.eventtap.event.newScrollEvent({dx * scrollmult, dy * scrollmult},{},'pixel')
    -- put the mouse back
    hs.mouse.setAbsolutePosition(oldmousepos)
    return true, {scroll}
end)

overrideRightMouseDown:start()
overrideRightMouseUp:start()
dragRightToScroll:start()

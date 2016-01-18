--
-- Author: Your Name
-- Date: 2016-01-16 16:18:29
--

--100 140
local ViewBox = class("ViewBox", function() 
		return cc.ClippingRegionNode:create()
	end)

function ViewBox:ctor()

	self:init()
end

function ViewBox:init()
	self:setClippingRegion(cc.rect(0, 0, 100, 140))
	local sp = display.newSprite("bg1.jpg")
		:addTo(self)
end

return ViewBox
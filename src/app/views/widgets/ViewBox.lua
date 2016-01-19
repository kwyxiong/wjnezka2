--
-- Author: Your Name
-- Date: 2016-01-16 16:18:29
--

--100 140

local ViewBox = class("ViewBox", function() 
		-- return display.newNode()
		return cc.ClippingRegionNode:create()
	end)
ViewBox.width = 100
ViewBox.height = 140
function ViewBox:ctor()

	self:init()
end

function ViewBox:init()
	self:setClippingRegion(cc.rect(-self.width/2, -self.height/2, self.width, self.height))
	local sp = display.newSprite("bg1.jpg")
		:addTo(self)
	-- self:setAnchorPoint(cc.p(0, 0))
end

return ViewBox
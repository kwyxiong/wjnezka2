--
-- Author: Your Name
-- Date: 2016-01-16 15:33:51
--
local Body = class("Body", function() 
		return display.newNode()
	end)

function Body:ctor()

	self:init()
end

function Body:init()
	local shenti = display.newSprite("shenti.png")
		:addTo(self)
	self:setScale(0.43)
end


return Body
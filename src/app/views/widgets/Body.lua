--
-- Author: Your Name
-- Date: 2016-01-16 15:33:51
--
local Body = class("Body", function() 
		return display.newNode()
	end)

function Body:ctor()

	self:init()
	self:setScale(0.43)
end

function Body:init()
	local shenti = display.newSprite("shenti.png")
		:zorder(gz("shenti"))
		:addTo(self)
	

	local neiyi = display.newSprite("neiyi_qingmu1.png")
		:zorder(gz("neiyi"))
		:addTo(self)
	
end


return Body
--
-- Author: Your Name
-- Date: 2016-01-16 16:09:35
--
local ViewBox = require("app.views.widgets.ViewBox")
local MainUI = class("MainUI", function() 
		return display.newNode()
	end)

function MainUI:ctor()

	self:init()
end

function MainUI:init()
	local bg = display.newScale9Sprite("scale9_1.png", 0, 0, cc.size(380, 520), cc.rect(35, 35,10,10))
		:addTo(self)
	local box = ViewBox.new()
		:addTo(self)
end


return MainUI
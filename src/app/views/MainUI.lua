--
-- Author: Your Name
-- Date: 2016-01-16 16:09:35
--
local MyPageView = require("app.views.widgets.MyPageView")

local MainUI = class("MainUI", function() 
		return display.newNode()
	end)

function MainUI:ctor()

	self:init()
end

function MainUI:init()
	local bg = display.newScale9Sprite("scale9_1.png", 0, 0, cc.size(380, 520), cc.rect(35, 35,10,10))
		:addTo(self)


	local myPageView = MyPageView.new()
		:pos(20, 0)
		:addTo(self)
	for k = 1, 7 do
		myPageView:addItemData({})
	end
	myPageView:showPage(1)

	local button = cc.ui.UIPushButton.new({images = {normal = "button1.png"}})
		:addTo(self)
end


return MainUI
--
-- Author: Your Name
-- Date: 2016-01-16 16:09:35
--
local MyPageView = require("app.views.widgets.MyPageView")
local MainUIButton = require("app.views.widgets.MainUIButton")
local MainUI = class("MainUI", function() 
		return display.newNode()
	end)

function MainUI:ctor()

	self:init()
end




function MainUI:init()
	local bg = display.newScale9Sprite("scale9_1.png", 0, 0, cc.size(420, 520), cc.rect(35, 35,10,10))
		:addTo(self)

	local bg = display.newScale9Sprite("scale9_1.png", 0, 0, cc.size(80, 520), cc.rect(35, 35,10,10))
		:pos(-170, 0)
		:addTo(self)

	local myPageView = MyPageView.new()
		:pos(20, 0)
		-- :addTo(self)
	for k = 1, 7 do
		myPageView:addItemData({})
		local button = MainUIButton.new("button".. k ..".png")
		:pos(-170, 215 + (k-1)*(-70))
		:addTo(self)
		:onButtonClicked(function(event) 
			-- dump(event)
		end)
		button:setScale(7/8)
	end
	-- myPageView:showPage(1)


	
	
end


return MainUI
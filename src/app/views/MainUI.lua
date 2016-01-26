--
-- Author: Your Name
-- Date: 2016-01-16 16:09:35
--
local LabelButton = require("app.views.widgets.LabelButton")
local MyPageView = require("app.views.widgets.MyPageView")
local MainUIButton = require("app.views.widgets.MainUIButton")
local MainUI = class("MainUI", function() 
		return display.newNode()
	end)

function MainUI:ctor()
	self.partData = {
		{G_EXCEL_TABLE_faxing},
		{G_EXCEL_TABLE_shangyi,G_EXCEL_TABLE_waitao},
	}
	self.myPageViews = {}
	self.bigPart = 1
	self.smallPart = 1
	self:init()

	-- local labelButton = LabelButton.new()
	-- 	:addTo(self, 9999)

end

function MainUI:initLeftButton()
	for k = 1, 7 do
		local button = MainUIButton.new("button".. k ..".png")
		:pos(-170, 215 + (k-1)*(-70))
		:addTo(self)
		:onButtonClicked(function(event) 
			-- dump(event)
		end)
		button:setScale(7/8)
	end
end


function MainUI:init()
	local bg = display.newScale9Sprite("scale9_1.png", 0, 0, cc.size(420, 520), cc.rect(35, 35,10,10))
		:addTo(self)

	local bg = display.newScale9Sprite("scale9_1.png", 0, 0, cc.size(80, 520), cc.rect(35, 35,10,10))
		:pos(-170, 0)
		:addTo(self)

	self:initLeftButton()

	self:showPart(2, 2)
	
end

function MainUI:showPart(bigPart, smallPart)
	if  not self.myPageViews[bigPart] or not self.myPageViews[bigPart][smallPart] then
		if not self.myPageViews[bigPart] then
			self.myPageViews[bigPart] = {}
		end
		local myPageView =  MyPageView.new()
			:pos(40, 0)
			:addTo(self)
			-- dump(self.partData[bigPart])
		for k, v in ipairs(self.partData[bigPart][smallPart]) do
			myPageView:addItemData(v)
		end
		self.myPageViews[bigPart][smallPart] = myPageView
	end
	
	self.myPageViews[bigPart][smallPart]:showPage(1)
end


return MainUI
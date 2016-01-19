--
-- Author: kwyxiong
-- Date: 2016-01-19 16:48:06
--
local ViewBox = require("app.views.widgets.ViewBox")
local MyPageView = class("MyPageView", function() 
		return display.newNode()
	end)

function MyPageView:ctor()
	self.row = 3
	self.col = 3
	self.numPerPage = self.row * self.col
	self.disX = 105
	self.disY = 150
	self.firstPosX = -105
	self.firstPosY = 150
	self.itemsNum = 0
	self.items = {}
	self.itemDatas = {}
	self:init()
end

function MyPageView:init()

end

function MyPageView:createItemByData(itemData)
	local viewBox = ViewBox.new()
	return viewBox
end

function MyPageView:addItemData(itemData)

	self.itemDatas[#self.itemDatas + 1] = itemData
	
end

function MyPageView:showPage(pageIndex)
	local pageNum = math.ceil(#self.itemDatas/self.numPerPage)
	if pageIndex > pageNum then
		print(pageIndex .. " page not exsit!")
		return
	end
	local index = 1
	local minIndex = (pageIndex - 1)*self.numPerPage + 1
	local maxIndex = (pageIndex - 1)*self.numPerPage + 9
	for k = minIndex, maxIndex do
		if k <= #self.itemDatas then
			if not self.items[k] then
				local item = self:createItemByData(itemData)
					:pos((index-1)%self.col*self.disX + self.firstPosX, math.floor((index-1) / self.col) *(-self.disY) + self.firstPosY)
					:addTo(self)
				self.items[k] = item
				index = index + 1
				-- dump(cc.p(item:getPosition()))
			end
		end
	end
	for k = 1, #self.itemDatas do
		if k >= minIndex and k <= maxIndex then
			self.items[k]:setVisible(true)
		else
			self.items[k]:setVisible(false)
		end
	end
end



return MyPageView
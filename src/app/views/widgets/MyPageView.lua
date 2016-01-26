--
-- Author: kwyxiong
-- Date: 2016-01-19 16:48:06
--
local MainUIButton = require("app.views.widgets.MainUIButton")
local ViewBox = require("app.views.widgets.ViewBox")
local MyPageView = class("MyPageView", function() 
		return display.newNode()
	end)

function MyPageView:ctor()
	self.row = 3
	self.col = 3
	self.curPage = 1
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
	self.preButton = MainUIButton.new("pre.png")
		:pos(-78, -240)
		:addTo(self)
		:onButtonClicked(function() 
				self:showPage(self.curPage - 1)
			end)


	self.nextButton = MainUIButton.new("next.png")
		:pos(78, -240)
		:addTo(self)
		:onButtonClicked(function() 
				self:showPage(self.curPage + 1)
			end)

	self.label = cc.ui.UILabel.new({text = "1/4", size = 18})
		:pos(0, -240)
		:addTo(self)
	self.label:setColor(cc.c3b(222, 222, 222))
	self.label:setAnchorPoint(cc.p(0.5, 0.5))

end

function MyPageView:createItemByData(itemData)
	print("createItem " .. #self.items)
	local viewBox = ViewBox.new(itemData)
	return viewBox
end

function MyPageView:addItemData(itemData)

	self.itemDatas[#self.itemDatas + 1] = itemData
	
end

function MyPageView:updateBottom()
	local pageNum = math.ceil(#self.itemDatas/self.numPerPage)
	self.label:setString(self.curPage .. "/" .. pageNum)
	if self.curPage < pageNum then
		self.nextButton:setVisible(true)
	else
		self.nextButton:setVisible(false)
	end
	if self.curPage > 1 then
		self.preButton:setVisible(true)
	else
		self.preButton:setVisible(false)
	end
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
			-- if not self.items[k] then
				local item = self:createItemByData(self.itemDatas[k])
					:pos((index-1)%self.col*self.disX + self.firstPosX, math.floor((index-1) / self.col) *(-self.disY) + self.firstPosY)
					:addTo(self)
				self.items[k] = item
				index = index + 1
				-- dump(cc.p(item:getPosition()))
		end
	end
	-- dump(self.items, "self.items")
	for k = 1, #self.itemDatas do
		if self.items[k] then
			if k >= minIndex and k <= maxIndex then
				self.items[k]:setVisible(true)
			else
				-- print("k", k)
				self.items[k]:setVisible(false)
			end
		end
	end

	self.curPage = pageIndex
	self:updateBottom()
end



return MyPageView
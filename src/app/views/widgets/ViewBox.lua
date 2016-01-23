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
function ViewBox:ctor(arg)
	self.data = arg
	self.reses = {}	--这个部位需要的图片，比如某个发型需要三张图片显示
	self:init()
end

function ViewBox:init()
	self:setClippingRegion(cc.rect(-self.width/2, -self.height/2, self.width, self.height))
	local sp = display.newSprite("shenti.png")
		:zorder(gz("shenti"))
		:pos(10, -170)
		:addTo(self)
	sp:setScale(0.35)
	whiteSprite(sp, 0.8)
	-- print(self.data["reses"])
	local reses = json.decode(self.data["reses"])
	self.reses = reses
	local zOrders = json.decode(self.data["zOrders"])
	-- self:setAnchorPoint(cc.pjson.decode(self.data["reses"])(0, 0))
	for k, v in ipairs(reses) do
		-- local toufa = cc.Sprite:createWithSpriteFrameName(v .. ".png");
		local toufa = display.newSprite("#" .. v .. ".png")
		-- local toufa = display.newSprite(v .. ".png")
		toufa:zorder(gz(zOrders[k]))
			:pos(10, -170)
			:addTo(self)
		toufa:setScale(0.35)
		-- print("aaaaaaaa")
	end
	-- dump(reses, "reses")
	-- drug(sp)
	local button = cc.ui.UIPushButton.new({normal = "box1.png", pressed = "box2.png"})
		:zorder(99)
		:addTo(self)
		:onButtonClicked(function() 

				broadCastMsg("playPartEffect", {data = self.data})
			end)	
end

return ViewBox
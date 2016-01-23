--
-- Author: kwyxiong
-- Date: 2016-01-20 15:07:45
--
local MainUIButton = class("MainUIButton", function() 
		return display.newNode()
	end)	

function MainUIButton:ctor(arg)
	self.imageFile = arg
	self.button = nil
	self:init()
end

function MainUIButton:init()
	self.button = cc.ui.UIPushButton.new({normal = self.imageFile})
		:addTo(self)
	whiteSprite(self.button.sprite_[1], 0.8)
	self.pressedSprite1 = display.newSprite(self.imageFile)
		:addTo(self)
	self.pressedSprite1:setVisible(false)
	whiteSprite(self.pressedSprite1)

	self.pressedSprite2 = display.newSprite(self.imageFile)
		:addTo(self)
	self.pressedSprite2:setVisible(false)
	blurSprite(self.pressedSprite2,5.0)

	self.button:onButtonPressed(function() 
			
			self.pressedSprite1:setVisible(true)
			self.pressedSprite2:setVisible(true)
			
		end)
	self.button:onButtonRelease(function()
			
			self.pressedSprite1:setVisible(false)
			self.pressedSprite2:setVisible(false)
			
		end)
end
	
function MainUIButton:onButtonClicked(func)
	self.button:onButtonClicked(func)
	return self
end

return MainUIButton
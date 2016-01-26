
--
-- Author: kwyxiong
-- Date: 2016-01-20 15:07:45
--
local LabelButton = class("LabelButton", function() 
		return display.newNode()
	end)	

function LabelButton:ctor(arg)
	self.text = arg
	self.button = nil
	self:init()
end

function LabelButton:init()
	self.button = cc.ui.UIPushButton.new({normal = "labelButton1.png", pressed = "labelButton3.png"})
		:addTo(self)
	
	self.label = cc.ui.UILabel.new({text = "及腰装", size = 16})
		:setColor(cc.c3b(222, 222, 222))
	self.button:setButtonLabel(self.label)

	self.button:onButtonPressed(function() 		
		end)
	self.button:onButtonRelease(function()
					
		end)
end
	
function LabelButton:onButtonClicked(func)
	self.button:onButtonClicked(func)
	return self
end

return LabelButton
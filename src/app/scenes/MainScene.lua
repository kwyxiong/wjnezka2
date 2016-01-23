

local Body = require("app.views.widgets.Body")
local MainUI = require("app.views.MainUI")
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
	self:initBg()
	self:initBody()
	self:initMainUI()
	-- self:test()
    -- cc.ui.UILabel.new({
    --         UILabelType = 2, text = "Hello, World", size = 64})
    --     :align(display.CENTER, display.cx, display.cy)
    --     :addTo(self)
    -- dump(G_EXCEL_TABLE_zOrders, "G_EXCEL_TABLE_zOrders")
end

function MainScene:test()

    local light = 0.5
    local sp = display.newSprite("shenti.png")
      :pos(360, 500)
      :addTo(self)
     sp:setScale(0.43)
    whiteSprite(sp, light)
    self:runAction(cc.RepeatForever:create(cc.Sequence:create(
        cc.DelayTime:create(0.016),
        cc.CallFunc:create(function() 
        	if light < 1 then
	            sp:getGLProgramState():setUniformFloat("light", light)
	            light = light + 0.02 
	        end
          end)
      )))
    local sp1 = display.newSprite("shenti.png")
      :pos(360, 500)
      :addTo(self)
    sp1:setScale(0.43)
    local index = 1.0
    blurSprite(sp1,index)
    self:runAction(cc.RepeatForever:create(cc.Sequence:create(
        cc.DelayTime:create(0.016),
        cc.CallFunc:create(function() 
        	if index < 60.0 then
	            sp1:getGLProgramState():setUniformFloat("blurRadius", index)
	            index = index + 2.0  
	        end
          end)
      )))
end




function MainScene:initBg()
	-- local bg = display.newSprite("bg1.jpg")
	-- local bg = cc.Sprite:create("bg1.jpg")
 --    bg:pos(display.cx, display.cy)
	-- 	:addTo(self)
	-- bg:setAnchorPoint(cc.p(0, 0))
	-- local path = cc.FileUtils:getInstance():fullPathForFilename("farm.jpg")
	-- print("papath",path)
	local bg = display.newSprite("bg1.jpg")
    	:pos(display.cx, display.cy)
		:addTo(self)
end

function MainScene:initBody()
  local body = Body.new()
    :pos(display.cx - 140, display.cy - 40)
    :addTo(self)
end

function MainScene:initMainUI()
  local mainUI = MainUI.new()
    :pos(display.right - 230, display.top - 300)
    :addTo(self)
end

function MainScene:onEnter()

end

function MainScene:onExit()
end

return MainScene

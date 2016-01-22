

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

    local light = 0.8
    local sp = display.newSprite("shenti.png")
      :pos(360, 500)
      :addTo(self)
    -- sp:setOpacity(0.1)
    self:whiteSprite(sp)
  -- sp:runAction(cc.RepeatForever:create(cc.Sequence:create(
  --    cc.FadeOut:create(1),
  --    cc.FadeIn:create(1)
  --  )))
    self:runAction(cc.RepeatForever:create(cc.Sequence:create(
        cc.DelayTime:create(0.016),
        cc.CallFunc:create(function() 
            -- sp:getGLProgramState():setUniformFloat("light", light)
            -- light = light + 0.01 
          end)
      )))
    local sp1 = display.newSprite("jiguan2.png")
      :pos(360, 500)
      :addTo(self)
    self:blurSprite(sp1)
    local index = 1
    self:runAction(cc.RepeatForever:create(cc.Sequence:create(
        cc.DelayTime:create(0.016),
        cc.CallFunc:create(function() 
            -- sp1:getGLProgramState():setUniformFloat("blurRadius", index)
            -- index = index + 1  
          end)
      )))
end

function MainScene:whiteSprite(sprite)
    local fileUtiles = cc.FileUtils:getInstance()
    local vertSource = Global_vertDefaultSource
    local fragSource = fileUtiles:getStringFromFile("shaders/example_white.fsh")
    local glProgam = cc.GLProgram:createWithByteArrays(vertSource,fragSource)
    local glprogramstate = cc.GLProgramState:getOrCreateWithGLProgram(glProgam)
    -- dump(sprite:getTextureRect())
    local resolution = cc.p(sprite:getTextureRect().width, sprite:getTextureRect().height)
    sprite:setGLProgramState(glprogramstate)
   	sprite:getGLProgramState():setUniformFloat("light", 0.8)

end

function MainScene:blurSprite(sprite)

    local fileUtiles = cc.FileUtils:getInstance()
    local vertSource = Global_vertDefaultSource
    local fragSource = fileUtiles:getStringFromFile("shaders/example_Blur.fsh")
    local glProgam = cc.GLProgram:createWithByteArrays(vertSource,fragSource)
    local glprogramstate = cc.GLProgramState:getOrCreateWithGLProgram(glProgam)
    -- dump(sprite:getTextureRect())
    local resolution = cc.p(sprite:getTextureRect().width, sprite:getTextureRect().height)
    sprite:setGLProgramState(glprogramstate)
    sprite:getGLProgramState():setUniformVec2("resolution", resolution)	
    sprite:getGLProgramState():setUniformFloat("blurRadius", 1)
end

function MainScene:initBg()
	local bg = display.newSprite("bg1.jpg")
    :pos(display.cx, display.cy)
		:addTo(self)
	-- bg:setAnchorPoint(cc.p(0, 0))

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

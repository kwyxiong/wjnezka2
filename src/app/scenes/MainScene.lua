

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
    self.handers = {
		regCallBack("playPartEffect", handler(self, self.playPartEffect))
	}
end

function MainScene:test()

    local light = 0.5
    local sp = display.newSprite("shenti.png")
      :pos(360, 500)
      :addTo(self)
     sp:setScale(Body.BodyScale)
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
    sp1:setScale(Body.BodyScale)
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
		:zorder(gz("bg"))
    	:pos(display.cx, display.cy)
		:addTo(self)
end

function MainScene:initBody()
  -- local sp = display.newSprite("2xx.png")
  -- 	:pos(display.cx, display.cy)
  -- 	:addTo(self)
 self.body = Body.new()
 	:zorder(gz("shenti"))
    :pos(Body.BodyPos.x, Body.BodyPos.y)
    :addTo(self)


end

function MainScene:makeFile(v, z)
	if not cc.FileUtils:getInstance():isFileExist("temp_" .. v .. ".png") then
		print("make file " .. "temp_" .. v .. ".png")
		local preSp = display.newSprite("#" .. v ..".png")
		  :zorder(10)
		  :pos(Body.BodyPos.x, Body.BodyPos.y)
	      :addTo(self)
	    preSp:setScale(Body.BodyScale)
	    local renderTexture = cc.RenderTexture:create(display.width, display.height, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)
	    renderTexture:retain()
	    renderTexture:begin()
	    preSp:visit()
	    renderTexture:endToLua()
	    -- whiteSprite(renderTexture, light)
	    renderTexture:saveToFile("temp_" .. v ..".png", cc.IMAGE_FORMAT_PNG)
		
		renderTexture:release()
		preSp:removeSelf()
	end
end

function MainScene:playPartEffect(evt)
	local data = evt.data.data
	local reses = json.decode(data["reses"])
	local zOrders = json.decode(data["zOrders"])

	local actionNode = display.newNode()
		:addTo(self)
	local time = 0
	local sps = {}
	local sp1s = {}
	local radius = 1.0
	local light = 1.0
	for k, v in ipairs(reses) do
		self:makeFile(v, zOrders[k])
	end
	actionNode:runAction(cc.Sequence:create(
		cc.DelayTime:create(0.016),
		cc.CallFunc:create(function()
				for k, v in ipairs(reses) do
			        local sprite = cc.Sprite:create("temp_" .. v ..".png")
			        -- print("sprite", sprite)
			        -- sprite:setAnchorPoint(cc.p(0.5, 0.5))
			        -- dump(sprite:getTextureRect())
			        sprite:pos(display.cx, display.cy)
			        	  :zorder(gz(zOrders[k]))
			        	  :addTo(self)
			        whiteSprite(sprite, light)
			        sps[#sps + 1] = sprite

			        local sprite1 = cc.Sprite:create("temp_" .. v ..".png")

			        sprite1:pos(display.cx, display.cy)
			        	  :zorder(gz(zOrders[k]))
			        	  :addTo(self)
			        blurSprite(sprite1,radius)
			        sp1s[#sp1s + 1] = sprite1
				end
				actionNode:runAction(cc.RepeatForever:create(cc.Sequence:create(
				        cc.DelayTime:create(0.1),
				        cc.CallFunc:create(function() 
				        	time = time + 0.1
				        	if time < 0.5 then
				        		if radius < 30.0 then
						        	for k, v in ipairs(sp1s) do			     	
								        v:getGLProgramState():setUniformFloat("blurRadius", radius)				            				      
								    end
								end
						    	radius = radius + 5.0  
						    else
					        	for k, v in ipairs(sp1s) do			     	
							        v:removeSelf()			            
							    end	
							    for k, v in ipairs(sps) do			     	
							        v:removeSelf()			            
							    end	
							    actionNode:removeSelf()	    	
						    end
				        end)
				      )))
		end))	)

end

function MainScene:initMainUI()
  local mainUI = MainUI.new()
  	:zorder(gz("mainUI"))
    :pos(display.right - 230, display.top - 300)
    :addTo(self)
end

function MainScene:onEnter()

end

function MainScene:onExit()
	for k, v in ipairs(self.handlers) do
		unRegCallBack({msgId = v})
	end

end

return MainScene

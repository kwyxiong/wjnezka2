--
-- Author: Your Name
-- Date: 2016-01-16 15:33:51
--
local Body = class("Body", function() 
		return display.newNode()
	end)
Body.BodyScale = 0.43
Body.BodyPos = cc.p(display.cx - 140, display.cy - 40)
function Body:ctor()

	self:init()
	self:setScale(self.BodyScale)

	self.handers = {
		-- regCallBack("playPartEffect", handler(self, self.playPartEffect))
	}
	self:setNodeEventEnabled(true)
end

function Body:onExit()
	for k, v in ipairs(self.handlers) do
		unRegCallBack({msgId = v})
	end

end


function Body:init()
	local shenti = display.newSprite("shenti.png")
		:zorder(gz("shenti"))
		:addTo(self)
	

	local neiyi = display.newSprite("neiyi_qingmu1.png")
		:zorder(gz("neiyi"))
		:addTo(self)


	
end

function Body:playPartEffect(evt)
	local data = evt.data.data

	local reses = json.decode(data["reses"])
	local zOrders = json.decode(data["zOrders"])

	local actionNode = display.newNode()
		:addTo(self)
	local sps = {}
	local sp1s = {}
	local radius = 1.0

	for k, v in ipairs(reses) do
	    local light = 1.0
	    local sp = display.newSprite("#" .. v ..".png")
	      :zorder(gz(zOrders[k]))
	      :addTo(self)
	    
	    local renderTexture = cc.RenderTexture:create(display.width, display.height, cc.TEXTURE2_D_PIXEL_FORMAT_RGB_A8888)
	    renderTexture:retain()
	    renderTexture:setScale(1/0.43)
	    self:addChild(renderTexture, -1)
	   	-- cc.Director:getInstance():getRunningScene():addChild(renderTexture, 999999)
	    renderTexture:setPosition(display.cx - 140, display.cy - 40)
	    renderTexture:begin()
	    sp:visit()
	    renderTexture:endToLua()
	    sp = renderTexture
	    -- whiteSprite(renderTexture, light)
	    renderTexture:saveToFile("temp_" .. v ..".png", cc.IMAGE_FORMAT_PNG)
	   
        -- local pImage = renderTexture:newImage()
        -- local tex = cc.Director:getInstance():getTextureCache():addImage(pImage, v .."11.png")
  		
  		-- print("tex", tex)
        local sprite = cc.Sprite:create("temp_" .. v ..".png")
        -- print("sprite", sprite)
        -- sprite:setAnchorPoint(cc.p(0.5, 0.5))
        -- dump(sprite:getTextureRect())
        sprite:setPosition(display.cx, display.cy)
        -- sprite:setScale(0.2)
        cc.Director:getInstance():getRunningScene():addChild(sprite, 999999)
        -- pImage:release()
        whiteSprite(sprite, light)
         sps[#sps + 1] = sprite

        local sprite = cc.Sprite:create("temp_" .. v ..".png")
        -- print("sprite", sprite)
        -- sprite:setAnchorPoint(cc.p(0.5, 0.5))
        -- dump(sprite:getTextureRect())
        sprite:setPosition(display.cx , display.cy)
        -- sprite:setScale(0.2)
        cc.Director:getInstance():getRunningScene():addChild(sprite, 999999)
        -- pImage:release()
       blurSprite(sprite,radius)
         sp1s[#sp1s + 1] = sprite

	    -- local sp1 = cc.Sprite:create(v ..".png")
	    --   :zorder(gz(zOrders[k]))
	    --   :addTo(self)
	    -- -- sp1s[#sp1s + 1] = sp1
	    -- blurSprite(sp1,radius)
	    -- sp1:setVisible(false)

	    -- renderTexture:saveToFile(k .. "xx.png", cc.IMAGE_FORMAT_PNG)
	    -- print(cc.FileUtils:getInstance():getWritablePath())


	end



	actionNode:runAction(cc.RepeatForever:create(cc.Sequence:create(
	        cc.DelayTime:create(0.016),
	        cc.CallFunc:create(function() 
	        	if radius < 150.0 then
	        		if radius < 100.0 then
			        	for k, v in ipairs(sp1s) do			     	
					        v:getGLProgramState():setUniformFloat("blurRadius", radius)				            				      
					    end
					end
			    	radius = radius + 10.0  
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
end


return Body
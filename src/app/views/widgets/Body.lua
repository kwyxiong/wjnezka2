--
-- Author: Your Name
-- Date: 2016-01-16 15:33:51
--
local Body = class("Body", function() 
		return display.newNode()
	end)
Body.BodyScale = 0.43
function Body:ctor()

	self:init()
	self:setScale(self.BodyScale)

	self.handers = {
		regCallBack("playPartEffect", handler(self, self.playPartEffect))
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
		print(v ..".png")
	    local light = 1.0
	    local sp = display.newSprite("#" .. v ..".png")
	      :zorder(gz(zOrders[k]))
	      :addTo(self)
	    whiteSprite(sp, light)
	    sps[#sps + 1] = sp

	    local sp1 = display.newSprite("#" .. v ..".png")
	      :zorder(gz(zOrders[k]))
	      :addTo(self)
	    sp1s[#sp1s + 1] = sp1
	    blurSprite(sp1,radius)

	end

	actionNode:runAction(cc.RepeatForever:create(cc.Sequence:create(
	        cc.DelayTime:create(0.016),
	        cc.CallFunc:create(function() 
	        	if radius < 150.0 then
	    --     		if radius < 10.0 then
			  --       	for k, v in ipairs(sp1s) do			     	
					--         v:getGLProgramState():setUniformFloat("blurRadius", radius)				            				      
					--     end
					-- end
			  --   	radius = radius + 23.0  
			    else
		      --   	for k, v in ipairs(sp1s) do			     	
				    --     v:removeSelf()			            
				    -- end	
				    -- for k, v in ipairs(sps) do			     	
				    --     v:removeSelf()			            
				    -- end	
				    -- actionNode:removeSelf()	    	
			    end
	        end)
	      )))
end


return Body
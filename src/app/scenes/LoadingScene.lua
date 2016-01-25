--
-- Author: kwyxiong
-- Date: 2016-01-22 17:06:17
--
local LoadingScene = class("LoadingScene", function()
    return display.newScene("LoadingScene")
end)

function LoadingScene:ctor()

    -- local m_nImageOffset = 0

    -- local size =cc.Director:getInstance():getWinSize()

    -- local label = cc.Label:createWithTTF("Loading...", s_markerFeltFontPath, 32)
    -- label:setAnchorPoint(cc.p(0.5, 0.5))
    -- label:setPosition(cc.p( size.width/2, size.height/2))
    -- self:addChild(label, 10)

    -- local  scale = cc.ScaleBy:create(0.3, 2)
    -- local  scale_back = scale:reverse()
    -- local  seq = cc.Sequence:create(scale, scale_back)
    -- label:runAction(cc.RepeatForever:create(seq))

    -- local function imageLoaded(texture)
    --     local director = cc.Director:getInstance()

    --     local sprite = cc.Sprite:createWithTexture(texture)
    --     sprite:setAnchorPoint(cc.p(0,0))
    --     self:addChild(sprite, -1)

    --     local size = director:getWinSize()
    --     local i = m_nImageOffset * 32
    --     sprite:setPosition(cc.p( i % size.width, math.floor((i / size.width)) * 32 ))

    --     m_nImageOffset = m_nImageOffset + 1
    --     cclog("Image loaded:...")-- %p", tex)
    -- end

    -- local function loadImages(dt)
    --     local i = 0
    --     local j = 0
    --     for i=0, 7 do
    --         for j=0, 7 do
    --             local szSpriteName = string.format(
    --                 "Images/sprites_test/sprite-%d-%d.png", i, j)
    --             cc.Director:getInstance():getTextureCache():addImageAsync(
    --                 szSpriteName, imageLoaded)
    --         end
    --     end

    --     self:unscheduleUpdate()
    -- end

    -- local function onNodeEvent(event)
    --     if event == "enter" then
    --         self:scheduleUpdateWithPriorityLua(loadImages,0)
    --     elseif event == "exit" then
    --         self:unscheduleUpdate()
          
    --     end
    -- end

    -- self:registerScriptHandler(onNodeEvent)
 	local loadingBar = ccui.LoadingBar:create()
    loadingBar:setTag(0)
    loadingBar:setName("LoadingBar")
    loadingBar:loadTexture("loading_1.png")
    loadingBar:setPercent(0)

    loadingBar:setPosition(display.width/2, 92)
    self:addChild(loadingBar)
  
    local allRes = {}
 	-- for k, v in ipairs(G_EXCEL_TABLE_faxing) do
 	-- 	local reses = json.decode(v["reses"])
 	-- 	for k1, v1 in ipairs(reses) do
 	-- 		allRes[#allRes + 1] = v1
 	-- 		-- cc.Director:getInstance():getTextureCache():addImageAsync(
  --   --""                 v1 .. ".png", imageLoaded)

 	-- 	end
 	-- end
 	-- local allRes = {"toufahou_0", "toufahou_1",
 	--  "toufaqian_0"}
 	local allRes = {"toufahou0", "toufahou1",
 	 "toufaqian0"}
  	-- local allRes = {"aa0"}	 
    local loadedNum = 0
    local allNum = #allRes
    local function imageLoaded(texture)
    	loadedNum = loadedNum + 1
    	print("loadedNum",loadedNum)
    	loadingBar:setPercent(math.floor(loadedNum/allNum*100))
    	if loadedNum == allNum then
    		self:loadOver()
    	end
    end

    for k, v in ipairs(allRes) do
    	 -- cc.Director:getInstance():getTextureCache():addImageAsync(
      --               v .. ".png", imageLoaded)
		-- display.addSpriteFrames(v .. ".plist", v .. ".png", imageLoaded)
    	 display.addSpriteFrames(v .. ".plist", v .. ".pvr.ccz", imageLoaded)
    	 -- cc.SpriteFrameCache:getInstance():addSpriteFrames(v .. ".plist", v .. ".pvr.ccz");
    end
    -- self:runAction(cc.Sequence:create(
    -- 		-- cc.DelayTime:create(0.016),
    -- 		cc.CallFunc:create(handler(self, self.loadOver))
    -- 	))	
    -- self:loadOver()
end

function LoadingScene:loadOver()
	print("MainScene")
	app:enterScene("MainScene")
end

function LoadingScene:onEnter()

end

function LoadingScene:onExit()

end

return LoadingScene

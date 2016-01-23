--
-- Author: kwyxiong
-- Date: 2016-01-15 19:15:28
--

Global_vertDefaultSource = "\n"..
"attribute vec4 a_position; \n" ..
"attribute vec2 a_texCoord; \n" ..
"attribute vec4 a_color; \n"..                                                    
"#ifdef GL_ES  \n"..
"varying lowp vec4 v_fragmentColor;\n"..
"varying mediump vec2 v_texCoord;\n"..
"#else                      \n" ..
"varying vec4 v_fragmentColor; \n" ..
"varying vec2 v_texCoord;  \n"..
"#endif    \n"..
"void main() \n"..
"{\n" ..
"gl_Position = CC_PMatrix * a_position; \n"..
"v_fragmentColor = a_color;\n"..
"v_texCoord = a_texCoord;\n"..
"}"

-- Global_part = {
-- 	{name = "发型", pages = {"发型"}},
-- 	{name = "上装", pages = {"上衣", "外套"}},
-- 	{name = "下装", pages = {"裤子", "裙子", "及腰装"}},
-- 	{name = "连衣装", pages = {"发型"}},
-- 	{name = "鞋袜", pages = {"发型"}},
-- 	{name = "饰品", pages = {"发型"}},
-- 	{name = "美容", pages = {"发型"}},
-- }




local zOrders = {
	"toufahou",
	"shenti",
	"neiyi",
	"yanjing",
	"meimao",
	"wazi",
	"xiazhuang",
	"xiezi",
	"lianyizhuang",
	"shangzhuang",
	"toufaqian",
	"shipin",
}

local function transZOrder(tb)
	local res = {}
	for k, v in ipairs(tb) do
		res[v] = k
	end
	return res
end

Global_zOrder = transZOrder(zOrders)

function gz(str)
	return Global_zOrder[str]
end

function whiteSprite(sprite, light)
    local fileUtiles = cc.FileUtils:getInstance()
    local vertSource = Global_vertDefaultSource
    local fragSource = fileUtiles:getStringFromFile("shaders/example_white.fsh")
    local glProgam = cc.GLProgram:createWithByteArrays(vertSource,fragSource)
    local glprogramstate = cc.GLProgramState:getOrCreateWithGLProgram(glProgam)
    -- dump(sprite:getTextureRect())
    sprite:setGLProgramState(glprogramstate)
   	sprite:getGLProgramState():setUniformFloat("light", light or 1.0)

end


function blurSprite(sprite, blurRadius)

    local fileUtiles = cc.FileUtils:getInstance()
    local vertSource = Global_vertDefaultSource
    local fragSource = fileUtiles:getStringFromFile("shaders/example_Blur.fsh")
    local glProgam = cc.GLProgram:createWithByteArrays(vertSource,fragSource)
    local glprogramstate = cc.GLProgramState:getOrCreateWithGLProgram(glProgam)
    -- dump(sprite:getTextureRect())
    local resolution = cc.p(sprite:getTextureRect().width, sprite:getTextureRect().height)
    sprite:setGLProgramState(glprogramstate)
    sprite:getGLProgramState():setUniformVec2("resolution", resolution)	
    sprite:getGLProgramState():setUniformFloat("blurRadius", blurRadius or 1.0)
end

function drug(node)
	-- local isDrugging = false
	node:addNodeEventListener(cc.NODE_TOUCH_EVENT,function(event_)

        if event_.name == "ended" then
        	-- if self.arg.sellMode then
        
			-- end
			--dump(CENTER_OFFSET,"CENTER_OFFSET")
			dump(cc.p(node:getPosition()))
		elseif event_.name == "moved"  then
			node:setPosition(event_)
        elseif event_.name == "began"  then
        	-- isDrugging = true
        	return true
        end
    end)
    node:setTouchEnabled(true)
    node:setTouchSwallowEnabled(false)
end
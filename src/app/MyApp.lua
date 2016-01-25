
require("config")
require("cocos.init")
require("framework.init")
require("app.utils.init")
require("app.data.init")
require("app.managers.init")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
	local addPaths = {
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
    cc.FileUtils:getInstance():addSearchPath("res/")
    cc.FileUtils:getInstance():addSearchPath(cc.FileUtils:getInstance():getWritablePath())
    

    for k, v in ipairs(addPaths) do
    	 cc.FileUtils:getInstance():addSearchPath("res/" .. v .."/")
    end
    self:enterScene("LoadingScene")
end

return MyApp

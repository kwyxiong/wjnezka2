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


Global_res = {
	"toufahou",
	"shenti",
	"toufaqian",
	"lianyizhuang",
	"meimao",
	"neiyi",
	"qunzihou",
	"shangzhuang",
	"shipin",
	"shipinhou",
	"waitaohou",
	"wazi",
	"xiazhuang",
	"xiezi",
	"yanjing",
	"zuiba",
}
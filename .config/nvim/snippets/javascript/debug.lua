local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local s = ls.snippet
local i = ls.insert_node
local l = require("luasnip.extras").lambda

return {
	s("de", fmt("console.info({<>})", { i(1, "vars") }, { delimiters = "<>" })),
}

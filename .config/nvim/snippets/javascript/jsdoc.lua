-- js
-- local log = require("vlog")

-- Create jsdoc header

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
local r = ls.restore_node
local c = ls.choice_node
local l = require("luasnip.extras").lambda

-- from https://github.com/L3MON4D3/LuaSnip/blob/master/Examples/snippets.lua#L81-L166
-- hacked up for javascript and jsdoc
local function jsdoc(args)
	local pstring = vim.trim(args[1][1])

	local nodes = {
		t({ "/**", " * " }),
		r(1, "desc", i(1, "A short Description")),
		t({ "", "" }),
	}

	-- At least one param.
	if #pstring > 0 then
		vim.list_extend(nodes, { t({ " * ", "" }) })
	end

	local insert = 2
	for arg in string.gmatch(pstring, "%w+") do
		local inode = r(insert, "arg" .. arg, i(1, "any"))
		vim.list_extend(
			nodes,
			{ t({ " * @param {" }), inode, t({ "} " .. arg .. " ", "" }) }
		)
		insert = insert + 1
	end

	vim.list_extend(nodes, {
		t({ " * @returns {" }),
		r(insert, "returns", i(1, "void")),
		t({ "} ", "" }),
	})
	vim.list_extend(nodes, { t({ " */" }) })

	local snip = sn(nil, nodes)
	return snip
end

return {
	-- function with jsdoc
	s({ trig = "@f", name = "function", dscr = "" }, {
		d(4, jsdoc, 3), -- generate the jsdoc
		t({ "", "" }),
		c(1, { -- choose function or method
			t({ "function " }),
			t({ "" }),
		}),
		i(2, "name"), -- give it a name
		t("("),
		i(3), -- parameters
		t(")"),
		t({ " {", "\t" }),
		i(0), -- body
		t({ "", "}" }),
	}),
	-- type declaration
	s({ trig = "@t", name = "type", dscr = "" }, {
		t({ "/** @type {" }),
		i(1, "any"), -- the type
		t({ "} */", "" }),
	}),
	-- type cast of selected text
	s({ trig = "@c", name = "cast", dscr = "" }, {
		t({ "/** @type {" }),
		i(1, "any"),
		t({ "} */ (" }),
		l(l.TM_SELECTED_TEXT),
		t({ ")" }),
		i(0),
	}),
	-- param
	s({ trig = "@p", name = "param", dscr = "" }, {
		t({ "@param {" }),
		i(1, "any"),
		t({ "} " }),
		i(0),
	}),
	-- property
	s({ trig = "@pr", name = "property", dscr = "" }, {
		t({ "@property {" }),
		i(1, "any"),
		t({ "} " }),
		i(0),
	}),
	-- returns
	s({ trig = "@r", name = "returns", dscr = "" }, {
		t({ "@returns {" }),
		i(1, "any"),
		t({ "} " }),
		i(0),
	}),
	-- typedef
	s({ trig = "@td", name = "typedef", dscr = "" }, {
		t({ "@typedef {" }),
		i(1, "any"),
		t({ "} " }),
		i(0),
	}),
}

std = "lua51"

max_line_length = false

exclude_files = {
	"Libs/",
	"*_test.lua",
	".luacheckrc",
	".luarocks/"
}

ignore = {
    "212/self",
    "212/event",
    "212/groupName",
    "213/index"
}

globals = {
    "LibStub",
    "C_LFGList"
}
-- .luacheckrc
--
-- 告诉 luacheck 哪些是预期的全局变量
globals = {
	"vim", -- Neovim 全局变量
	"it", -- 如果你在测试中使用 Busted/Plenary.test
	"describe", -- 同上
	"after_each", -- 同上
	"before_each", -- 同上
}

-- 建议添加的其他常见配置 (可选)

-- 允许在顶级作用域定义变量，这在 Neovim 配置中很常见
-- 例如：local map = vim.keymap.set
allow_defined_top = true

-- 默认的全局变量，通常不需要明确指定，但为了完整性可以列出
-- 允许使用标准的 Lua 全局函数和变量
-- std = {
--     "luaj", "min", "max", "io", "string", "math", "table", "os",
--     "coroutine", "debug", "package", "print", "pairs", "ipairs",
--     "setmetatable", "getmetatable", "rawequal", "rawget", "rawset",
--     "select", "tonumber", "tostring", "type", "error", "assert",
--     "pcall", "xpcall", "next", "dofile", "loadfile", "load", "loadstring",
--     "collectgarbage", "module", "require", "getfenv", "setfenv",
--     "_G", "_VERSION", "tostring", "tonumber", "type", "pairs", "ipairs",
--     "print", "next", "rawequal", "rawget", "rawset", "getmetatable", "setmetatable",
--     "error", "assert", "select", "pcall", "xpcall", "load", "dofile", "loadfile", "loadstring",
--     "collectgarbage", "module", "require", "getfenv", "setfenv", "_G", "_VERSION",
--     "unpack", "bit32", "utf8", "debug", "jit" -- Lua 5.2+ specifics
-- }

-- 忽略某些文件或目录 (例如，插件目录)
-- ignore = {
--     "lua/lazy-lock.nvim/", -- LazyVim 的插件管理目录
--     "lua/plugin/",         -- 如果你的插件是独立文件而不是模块
--     "lua/plugins/**",      -- LazyVim 的插件配置目录，如果你的配置会导致大量 luacheck 警告
-- }

-- 可以根据需要调整其他 linting 规则
-- max_line_length = 120
-- max_args = 5
-- max_returns = 3
-- max_depth = 5

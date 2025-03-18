.PHONY: check

check:
	@# Check if luacheck is installed
	@if ! command -v luacheck > /dev/null 2>&1; then \
		echo "Error: luacheck is not installed."; \
		echo "Install it via LuaRocks: 'luarocks install luacheck'"; \
		echo "Or visit: https://github.com/mpeterv/luacheck"; \
		exit 1; \
	fi
	@# Check if stylua is installed
	@if ! command -v stylua > /dev/null 2>&1; then \
		echo "Error: stylua is not installed."; \
		echo "Install it via Cargo: 'cargo install stylua' (if you have Rust installed)"; \
		echo "Or visit: https://github.com/JohnnyMorganz/StyLua"; \
		exit 1; \
	fi
	@echo "Running luacheck..."
	@luacheck .
	@echo "-------------------"
	@echo "Running stylua..."
	@stylua --check .
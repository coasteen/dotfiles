all: lua/config.lua

lua/%.lua: fnl/%.fnl
	fennel --compile $< > $@

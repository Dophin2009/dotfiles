STEW ?= stew

LIB := lib
VENDOR := vendor
PROFILES := profiles
LOADED := loaded.lua

.PHONY : prepare gruvbox nord iceberg

prepare:
	git submodule update --init --recursive
	cd $(VENDOR)/luafilesystem && \
		make lib
	ln -sf ../luafilesystem/src/lfs.so $(LIB)/lfs.so

gruvbox	:
	ln -sf $(PROFILES)/gruvbox.lua $(LOADED)
	$(STEW) -vvv $(wildcard packages/*)

nord :
	ln -sf $(PROFILES)/nord.lua $(LOADED)
	$(STEW) -vvv $(wildcard packages/*)

iceberg :
	ln -sf $(PROFILES)/iceberg.lua $(LOADED)
	$(STEW) -vvv $(wildcard packages/*)

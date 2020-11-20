STEW ?= stew

LIB := lib
VENDOR := vendor
PROFILES := profiles
LOADED := loaded.lua

.PHONY : gruvbox nord iceberg

gruvbox	:
	ln -sf $(PROFILES)/gruvbox.lua $(LOADED)
	$(STEW) -vvv $(wildcard packages/*)

nord :
	ln -sf $(PROFILES)/nord.lua $(LOADED)
	$(STEW) -vvv $(wildcard packages/*)

iceberg :
	ln -sf $(PROFILES)/iceberg.lua $(LOADED)
	$(STEW) -vvv $(wildcard packages/*)

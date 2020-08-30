PROFILE := gruvbox

ROOT := $(shell pwd)
ENVFILE := sh/tree/.config/sh/env

BASE_PACKAGES := sh user-dirs
DEV_PACKAGES := android cargo docker dotnet ghcup git go gradle java maven mysql npm nuget nvm \
	pgsql pylint python R ruby rustup stack texlive
CLI_PACKAGES := bat beets bitwarden cursedtag dicth dotprofile elinks gnupg hangups ibus less mpd mullvad mutt \
	ncmpcpp neofetch newsboat notmuch nvim pass ranger slack-term screen task tmux urlview \
	weechat wget wine youtube-dl zsh
GUI_PACKAGES := alacritty battery-notify dunst gimp fscreenshot gtk i3 lock-screen mpdnotify \
	mplayer networkmanager-dmenu polybar qutebrowser rofi set-brightness steam terminfo \
	termite wallpaper X11 zathura zprofile
DISTRO_PACKAGES := pacman

ALL_PACKAGES = $(BASE_PACKAGES) $(DEV_PACKAGES) $(CLI_PACKAGES) $(GUI_PACKAGES)

DOTPROFILE := dotprofile
PROFILE_ACTIVATE := $(DOTPROFILE) -vvv activate $(PROFILE)

define link
	mkdir -p ${HOME}/$(dir $2);
	ln -sf "$(ROOT)/$1" "${HOME}/$2";
endef

define link_files
	$(foreach f,$(shell find $1 -type f),$(call link,$(f),$(shell realpath --relative-to $1 $(f))))
endef

define link_files_rel
	$(foreach f,$(shell find $1 -type f),$(call link,$(f),$2/$(shell realpath --relative-to $3 $(f))))
endef

define link_files_tree
	$(call link_files_rel,$1/tree,.,$1/tree)
endef

define link_files_shallow
	$(foreach f,$(wildcard $1/*),$(call link,$(f),$2/$(f)))
endef

define link_files_shallow_rel
	$(foreach f,$(wildcard $1/*),$(call link,$(f),$2/$(shell realpath --relative-to $3 $(f))))
endef


.PHONY : all base dev cli gui bootstrap update-submodules $(ALL_PACKAGES)

default :

all : $(ALL_PACKAGES)
base : $(BASE_PACKAGES)
dev : $(DEV_PACKAGES)
cli : $(CLI_PACKAGES)
gui : $(GUI_PACKAGES)

bootstrap : update-submodules base

update-submodules :
	@echo "-- Updating submodules..."
	@git submodule update --recursive --init

###
### -- Base Packages
###

sh :
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

user-dirs : sh
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

###
### -- Dotprofile
###

dotprofile : sh
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

###
### -- Dev Packages
###

android : base
	@echo "-- Linking $@"
	@$(call link_files_tree,$@)

cargo : base
	@echo "-- Linking $@"
	@$(call link_files_tree,$@)

docker : base
	@echo "-- Linking $@"
	@$(call link_files_tree,$@)

dotnet : base
	@echo "-- Linking $@"
	@$(call link_files_tree,$@)

ghcup : base
	@echo "-- Linking $@"
	@$(call link_files_tree,$@)

git : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

go : base
	@echo "-- Linking $@"
	@$(call link_files_tree,$@)

gradle : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

java : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

maven : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

mysql : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

npm : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

nuget : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

nvm : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

pgsql : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

pylint : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

python : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

R : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

ruby : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

rustup : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

stack : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

texlive : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

###
### -- CLI Packages
###

bat : base dotprofile
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@echo "-- Processing $@..."
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) $@ > /dev/null 2>&1

beets : base dotprofile
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@echo "-- Processing $@..."
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) $@ > /dev/null 2>&1
	@. $(ENVFILE) && \
		mkdir -p ${XDG_DATA_HOME}/$@

bitwarden : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

cursedtag : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

dicth : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

elinks : base urlview
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

gnupg :
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

hangups : base dotprofile
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@echo "-- Processing $@..."
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) $@ > /dev/null 2>&1

ibus :
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

less : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@echo "-- Bootstrapping $@"
	@. $(ENVFILE) && \
		mkdir -p ${XDG_CACHE_HOME}/$@

mpd : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@. $(ENVFILE) && \
		mkdir -p ${XDG_DATA_HOME}/$@

mullvad : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

mutt : base elinks
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

ncmpcpp : base mpd
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

newsboat : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

notmuch : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

nvim : base dotprofile
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@echo "-- Processing neovim"
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) neovim > /dev/null 2>&1
	@echo "-- Bootstrapping neovim"
	@. $(ENVFILE) && \
		$@/tree/.config/nvim/scripts/bootstrap

pass : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

ranger : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

task: base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) taskwarrior > /dev/null 2>&1

tmux : base dotprofile
	@echo "-- Linking $@..."
	-@. $(ENVFILE) && \
		rm -rf ${XDG_DATA_HOME}/tmux/plugins/tpm
	@$(call link_files_tree,$@)
	@echo "-- Processing $@..."
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) $@ > /dev/null 2>&1

urlview : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

weechat : base
	@echo "-- Linking $@"
	@$(call link_files_tree,$@)

wget : base
	@echo "-- Linking $@"
	@$(call link_files_tree,$@)

wine : base
	@echo "-- Linking $@"
	@$(call link_files_tree,$@)

youtube-dl : base
	@echo "-- Linking $@"
	@$(call link_files_tree,$@)

zsh : base tmux
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

###
### -- GUI Packages
###

X11 : base dotprofile
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@echo "-- Processing xresources-theme..."
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) xresources-theme > /dev/null 2>&1
	@. $(ENVFILE) && \
		mkdir -p "${XDG_LOG_HOME}/$@"

alacritty : base dotprofile terminfo
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@echo "-- Processing $@..."
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) $@ > /dev/null 2>&1

battery-notify : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

dunst : base dotprofile
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@echo "-- Processing $@..."
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) $@ > /dev/null 2>&1

fscreenshot : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

gimp : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

gtk : base dotprofile
	@echo "-- Linking $@..."
	@$(call link_files_rel,$@/tree/.config,.config,$@/tree/.config)
	-@. $(ENVFILE) && \
		rm -f $(foreach f,$(wildcard $@/tree/local/share/themes/*),"${XDG_DATA_HOME}/themes/$(shell realpath --relative-to $@/tree/.local/share/themes $(f))")
	@$(call link_files_shallow_rel,$@/tree/.local/share/themes,.local/share/themes,$@/tree/.local/share/themes)
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) $@ > /dev/null 2>&1

i3 : base dotprofile polybar wallpaper fscreenshot
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@echo "-- Processing $@..."
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) $@ > /dev/null 2>&1

lock-screen : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

mpdnotify : base mpd
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

mplayer : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

networkmanager-dmenu : base rofi
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

polybar : base dotprofile
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@echo "-- Processing polybar-network..."
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) polybar-network > /dev/null 2>&1
	@echo "-- Processing $@..."
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) $@ > /dev/null 2>&1

qutebrowser : base dotprofile
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@echo "-- Downloading and verifying $@ userscripts..."
	@. $(ENVFILE) && \
		$@/greasemonkey-dl.sh
	@echo "-- Processing $@..."
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) $@ > /dev/null 2>&1

rofi : base dotprofile
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@echo "-- Processing $@..."
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) $@ > /dev/null 2>&1

set-brightness : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

steam : SKINS_DIR = ${XDG_DATA_HOME}/Steam/skins
steam : SKINS_DIR_METRO = $(SKINS_DIR)/metro-for-steam-4.4
steam : METRO_ZIP = $(SKINS_DIR)/metro-for-steam-4.4.zip
steam : METRO_PATCH = $(SKINS_DIR)/metro-for-steam-4.4-patch
steam : base wget
	@echo "-- Installing Steam skin..."
	@. $(ENVFILE) && \
		mkdir -p $(SKINS_DIR) && \
		wget -O $(METRO_ZIP) "https://github.com/minischetti/metro-for-steam/archive/v4.4.zip" > /dev/null 2>&1 && \
		unzip -o $(METRO_ZIP) -d $(SKINS_DIR) > /dev/null 2>&1 && \
		rm $(METRO_ZIP)
	@echo "-- Installing metro-for-steam patch..."
	@. $(ENVFILE) && \
		git clone "https://github.com/redsigma/UPMetroSkin.git" $(METRO_PATCH) > /dev/null 2>&1 && \
		cp -r "$(METRO_PATCH)/Unofficial 4.x Patch/Main Files [Install First]"/* $(SKINS_DIR_METRO) && \
		rm -rf $(METRO_PATCH)

terminfo : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

termite : base dotprofile gtk terminfo
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)
	@echo "-- Processing $@..."
	@. $(ENVFILE) && \
		$(PROFILE_ACTIVATE) $@ > /dev/null 2>&1

wallpaper : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

zathura : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

zprofile : base X11 zsh
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

###
### -- Distro Packages
###

pacman : base
	@echo "-- Linking $@..."
	@$(call link_files_tree,$@)

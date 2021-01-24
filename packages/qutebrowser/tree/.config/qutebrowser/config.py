# type: ignore
import glob
import os
import sys

import yaml
from qutebrowser.config.config import ConfigContainer  # noqa: F401
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
# pylint: disable=C0111
config = config  # type: ConfigAPI # noqa: F821 pylint: disable=E0602,C0103
c = c  # type: ConfigContainer # noqa: F821 pylint: disable=E0602,C0103

# for next qutebrowser version
#  config.load_autoconfig(False)

# aliases
aliases = {'bw': 'spawn --userscript qute-bitwarden',
           'json': 'spawn --userscript format_json',
           'code': 'spawn --userscript format_code',
           'mpv': 'spawn --userscript view_in_mpv',
           'gr': 'greasemonkey-reload',
           'w': 'session-save',
           'wq': 'quit --save',
           'wqa': 'quit --save',
           'q': 'close',
           'qa': 'quit'}
for k, v in aliases.items():
    c.aliases[k] = v

# enable session autosaving
c.auto_save.session = True

# custom keybinds
config.bind(',n', 'open -t ;; messages')
config.bind(',m', 'mpv')
config.bind('ch', 'history-clear')
config.bind('gy', 'open-editor')

# completion settings
c.completion.cmd_history_max_items = 0
c.completion.web_history.max_items = 0

# wait for downloads when quitting
c.confirm_quit = ['downloads']

# content settings
# disable autoplay
c.content.autoplay = False
# enable canvas, webgl, and clipboard access
c.content.canvas_reading = True
c.content.webgl = True
c.content.javascript.can_access_clipboard = True
# disable geolocation
c.content.geolocation = False
# set user agent string
c.content.headers.user_agent = ('Mozilla/5.0 (Windows NT 10.0; Win64; x64)'
                                ' AppleWebKit/537.36 (KHTML, like Gecko)'
                                ' Chrome/79.0.3945.117 Safari/537.36')
# set YouTube user agent string
youtube_user_agent = ('Google Bot (Mozilla/5.0'
                      ' (compatible; Googlebot/2.1;'
                      ' +http://www.google.com/bot.html))')
config.set('content.headers.user_agent',
           youtube_user_agent, '*://youtube.com/')
# enable pdfjs
c.content.pdfjs = True
# set webrtc policy
c.content.webrtc_ip_handling_policy = "default-public-interface-only"
# reject 3rd party cookies
c.content.cookies.accept = "no-3rdparty"

# per-domain styles
user_styles_dir = os.path.join(config.configdir, 'styles', '*.user.css')
c.content.user_stylesheets = glob.glob(user_styles_dir)

# editor command
c.editor.command = ['alacritty', '-e', 'nvim',
                    '{file}', '-c', 'normal {file}G{column0}l']

# default fonts
c.fonts.default_family = ['JetBrains Mono Nerd Font', 'Iosevka',
                          'Inconsolata', 'Fira Code', 'DejaVu Sans Mono']
c.fonts.default_size = '10pt'

# QT hidpi fix
c.qt.highdpi = True

# enable smooth scrolling
c.scrolling.smooth = True

# pinned tabs not frozen
c.tabs.pinned.frozen = False

# use DuckDuckGo as default start page
c.url.default_page = 'https://start.duckduckgo.com/'
c.url.start_pages = 'https://start.duckduckgo.com/'

# load search engines
c.url.searchengines['DEFAULT'] = 'https://duckduckgo.com/?q={}'
# load local searchengines file if exists
try:
    with (config.configdir / 'searchengines.yaml').open() as f:
        yaml_data = yaml.safe_load(f)

    for k, v in yaml_data.items():
        c.url.searchengines[k] = v
except IOError:
    pass

# register jmatrix
try:
    sys.path.append(os.path.join(sys.path[0], 'jmatrix'))
    config.source("jmatrix/jmatrix/integrations/qutebrowser.py")
except ValueError:
    pass

# enable dynamic theme loading
config.source("qutewal.py")

# load local config
local_config_file = "config.local.py"
try:
    with (config.configdir / local_config_file).open() as f:
        config.source(local_config_file)
except IOError:
    pass

import sys
import os
import yaml

# pylint: disable=C0111
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config = config  # type: ConfigAPI # noqa: F821 pylint: disable=E0602,C0103
c = c  # type: ConfigContainer # noqa: F821 pylint: disable=E0602,C0103

# load autoconfig.yml
# config.load_autoconfig()

# aliases
aliases = {'bw': 'spawn --userscript qute-bitwarden',
           'json': 'spawn --userscript format_json',
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
c.content.javascript.can_access_clipboard = False
# disable geolocation
c.content.geolocation = False
# set user agent string
c.content.headers.user_agent = ('Mozilla/5.0 (Windows NT 10.0; Win64; x64)'
                                'AppleWebKit/537.36 (KHTML, like Gecko)'
                                'Chrome/79.0.3945.117 Safari/537.36')
# enable pdfjs
c.content.pdfjs = True
# set webrtc policy
c.content.webrtc_ip_handling_policy = "default-public-interface-only"

# editor command
c.editor.command = ['alacritty', '-e', 'nvim',
                    '{file}', '-c', 'normal {file}G{column0}l']

# default fonts
c.fonts.default_family = ['Iosevka',
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
sys.path.append(os.path.join(sys.path[0], 'jmatrix'))
config.source("jmatrix/jmatrix/integrations/qutebrowser.py")

# enable dynamic theme loading
config.source("qutewal.py")

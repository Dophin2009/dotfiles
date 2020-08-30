import sys
import os
import pathlib
import urllib.request

# pylint: disable=C0111
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
c = c  # type: ConfigContainer # noqa: F821 pylint: disable=E0602,C0103
config = config  # type: ConfigAPI # noqa: F821 pylint: disable=E0602,C0103

# load autoconfig.yml
config.load_autoconfig()

# register jmatrix
sys.path.append(os.path.join(sys.path[0], 'jmatrix'))
config.source("jmatrix/jmatrix/integrations/qutebrowser.py")

# enable dynamic theme loading
config.source("qutewal.py")

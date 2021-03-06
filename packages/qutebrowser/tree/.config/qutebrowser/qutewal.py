# type: ignore
import os

# pylint: disable=C0111
config = config  # noqa: F821 pylint: disable=E0602,C0103
c = c   # noqa: F821 pylint: disable=E0602,C0103

qutewal_dynamic_loading = True

home = os.getenv('HOME')
theme_relative = '.config/qutebrowser/theme.py'
daemon_relative = '.config/qutebrowser/qutewald.py'
theme_absolute = os.path.join(home, theme_relative)
daemon_absolute = os.path.join(home, daemon_relative)

if os.path.isfile(theme_absolute):
    config.source(theme_absolute)

    #  if qutewal_dynamic_loading or bool(os.getenv('QUTEWAL_DYNAMIC_LOADING')):
    if False:
        import signal
        import subprocess
        import prctl

        # start iqutefy to refresh colors on the fly
        qutewald = subprocess.Popen(
            [daemon_absolute, theme_absolute],
            preexec_fn=lambda: prctl.set_pdeathsig(signal.SIGTERM))

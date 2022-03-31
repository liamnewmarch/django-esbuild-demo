from os import getenv
from subprocess import Popen

from django.core.management.commands.runserver import (
    Command as RunserverCommand,
)
from django.conf import settings


class Command(RunserverCommand):
    def run(self, **options):
        if self.use_static and not getenv("RUN_MAIN"):
            static_root = getattr(settings, "STATIC_ROOT", "")
            with Popen(
                [
                    self.esbuild_path,
                    static_root,
                    # TODO make these options configurable
                    "--bundle",
                    "--entry-names=app",
                    "--log-level=warning",
                    "--minify",
                    "--serve=8001",
                    f"--servedir={static_root}",
                    "--sourcemap",
                ],
            ):
                print('esbuild server started.')
                super().run(**options)
            print("esbuild server stopped.")
        else:
            super().run(**options)

from pathlib import Path

from django.core.management.utils import get_random_secret_key


ALLOWED_HOSTS = []

BASE_DIR = Path(__file__).resolve().parent.parent

DEBUG = True

INSTALLED_APPS = [
    "app.esbuild",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.staticfiles",
]

ROOT_URLCONF = "app.urls"

SECRET_KEY = get_random_secret_key()

STATIC_ROOT = BASE_DIR / "static"
STATIC_URL = "http://localhost:8001/"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [
            BASE_DIR / "templates",
        ],
    },
]

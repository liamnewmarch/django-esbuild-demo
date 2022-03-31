# Django 🤝 esbuild

[esbuild](https://esbuild.github.io) is a front-end build tool that’s super fast, and has a batteries-include approach which pairs _really_ well with [Django](https://www.djangoproject.com).

This repo showcases how a Django project could be configured to use esbuild as a static file server. This is done by Django’s [`runserver`](https://docs.djangoproject.com/en/4.0/ref/django-admin/#runserver) command. It’s intended as a demo so edge cases are not handled and configuration is basically non-existant.

## Running the demo

You will need recent versions of Python 3, Node and npm.

```sh
# Use your preferred method of creating a virtual env, e.g.
python3 -m venv venv
. venv/bin/activate

# Install the project dependencies (Django and esbuild)
pip install -r requirements.txt
npm install

# Run the demo
./manage.py runserver
```

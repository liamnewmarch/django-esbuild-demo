ESBUILD ?= node_modules/.bin/esbuild
PYTHON ?= venv/bin/python

.PHONY: usage
usage:
	@echo 'Django + esbuild demo'
	@echo
	@echo 'Usage:'
	@echo '  make serve            Run the demo'
	@echo '  make serve-app        Serve only the Django app'
	@echo '  make serve-static     Serve only the esbuild static files'
	@echo '  make build            Compile static assets to build/'

# Create a Python virtualenv and install dependencies
venv: PYTHON_PATH ?= $(shell which python3)
venv:
	@$(PYTHON_PATH) -m venv venv
	@$(PYTHON) -m pip install -r requirements.txt

# Install Node dependencies
node_modules: NPM_PATH ?= $(shell which npm)
node_modules:
	@$(NPM_PATH) install


# Install Python and Node dependencies
.PHONY: setup
setup: venv node_modules

# Run the Django development server
.PHONY: serve-app
serve-app: PORT ?= 8000
serve-app: setup
	@$(PYTHON) manage.py runserver $(PORT)

# Run the esbuild development server
.PHONY: serve-static
serve-static: PORT ?= 8001
serve-static: setup
	@$(ESBUILD) ./static --bundle --entry-names=app --minify --serve=$(PORT) --servedir=$(SRC) --sourcemap

# The default target when `make` is called
.PHONY: serve
serve: setup
	@$(MAKE) -j 2 serve-app serve-static

# Build static files to serve in production
.PHONY: build
build: setup
	@$(ESBUILD) ./static --bundle --entry-names=app --minify --outdir=build

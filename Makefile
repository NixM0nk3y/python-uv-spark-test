# deployment environment
export MODULE_VERSION ?= 0
export RESOLVED_SOURCE_VERSION ?=$(shell git rev-list -1 HEAD --abbrev-commit)
export DATE=$(shell date -u '+%Y%m%d')

# Output helpers
# --------------

TASK_DONE = echo "✓  $@ done"
TASK_BUILD = echo "🛠️  $@ done"

# ----------------

.DEFAULT_GOAL := build

clean:
	@rm -rf build dist
	@git clean -fdx
	@$(TASK_DONE)

version/pipeline:
	@sed -i "s/__version__ =.*/__version__ = \"1.0.$(MODULE_VERSION)\"/" ./src/sqltest/__init__.py

test: init
	@uv run --with pytest-spark pytest

lint:
	@echo "linting code"
	@uv run ruff check  ./src

lint/fix:
	@echo "linting code"
	@uv run ruff format ./src

format:
	@uv run black ./src --check --diff

format/fix:
	@uv run black ./src

build: init
	@$(TASK_DONE)

init:
	@uv venv
	@$(TASK_DONE)
.PHONY: help install diagrams serve build clean

DIAGRAMS_OUT    := docs/framework/assets/diagrams
DRAWIO_SOURCES  := $(wildcard original-diagrams/*.drawio)

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "  install   Create .venv and install all dependencies via uv"
	@echo "  diagrams  Export all .drawio files to SVG + PNG in $(DIAGRAMS_OUT)/"
	@echo "  serve     Start local dev server at http://127.0.0.1:8000"
	@echo "  build     Build the static site to site/"
	@echo "  clean     Remove the generated site/ directory"

install:
	uv sync

diagrams: $(DIAGRAMS_OUT)
	@for src in $(DRAWIO_SOURCES); do \
		base=$$(basename $$src .drawio); \
		echo "  $$base"; \
		drawio --export --format svg --output $(DIAGRAMS_OUT)/$$base.svg $$src; \
		drawio --export --format png --output $(DIAGRAMS_OUT)/$$base.png $$src; \
	done

$(DIAGRAMS_OUT):
	mkdir -p $@

serve:
	uv run mkdocs serve --dirtyreload

build:
	uv run mkdocs build

clean:
	rm -rf site/

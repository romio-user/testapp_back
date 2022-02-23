SHELL := /bin/bash
CURRENT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: clean install test

clean:
	@echo "Clean"
	rm -rf .py3 __pycache__

install:
	@echo "Setup"
	virtualenv .py3
	.py3/bin/pip3 install -r requirements.txt

test:
	@echo "Run Tests"
	.py3/bin/python3 -m unittest tests/*.py

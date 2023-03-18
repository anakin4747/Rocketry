# Define variables                                                    
VENV_NAME := rock
PYTHON := $(VENV_NAME)/bin/python3
PIP := $(VENV_NAME)/bin/pip3
MAIN_FILE := src/main.py
PYTHON_FILES := $(shell find src -name '*.py')
 
# Default target runs project
run: $(MAIN_FILE)
	$(PYTHON) $(MAIN_FILE)


$(MAIN_FILE): $(PYTHON_FILES)
	touch $(MAIN_FILE)

   
# Set up virtual environment
venv:
	$(PYTHON) -m venv $(VENV_NAME)
	$(PIP) install --upgrade pip


build: setup.py
	$(PYTHON) setup.py sdist bdist_wheel

   
# Install project dependencies
deps: venv
	$(PIP) install -r requirements.txt

install: clean deps build
	$(PIP) install dist/*.tar.gz
   

# Clean up generated files
clean:
	rm -rf build dist *.egg-info
   



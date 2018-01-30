TEST_CMD=setup.py test --addopts --boxed
clean:
	find . -name '*.pyo' -delete
	find . -name '*.pyc' -delete
	find . -name __pycache__ -delete
	find . -name '*~' -delete
	find . -name '*.egg-info' -delete

lint:
	flake8 atm && isort --check-only --recursive atm

test: lint
	python $(TEST_CMD)

installdeps:
	pip install --upgrade pip
	pip install -e . --process-dependency-links
	pip install -r requirements-dev.txt


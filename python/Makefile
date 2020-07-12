MODULE=$(shell ls -d -C beamx *.py)
FILES_TO_IGNORE=
ISORT_SKIP_PARAM=

lint/pylint: $(MODULE)
	pylint ${MODULE} -j8 --ignore-patterns="${FILES_TO_IGNORE}"

lint/flake8: $(MODULE)
	flake8 ${MODULE} --count \
		--show-source --statistics \
		--exclude="${FILES_TO_IGNORE}"

lint/isort: $(MODULE)
	isort ${MODULE} -j8 --recursive ${ISORT_SKIP_PARAM} \
		--diff --check-only

lint/yapf: $(MODULE)
	yapf --parallel --recursive ${MODULE} \
		--diff

lint: lint/pylint lint/flake8 lint/isort lint/yapf
	@:

format/isort: $(MODULE)
	isort ${MODULE} -j8 --recursive ${ISORT_SKIP_PARAM}

format/yapf: $(MODULE)
	yapf --parallel --recursive ${MODULE} \
		--in-place

format: format/isort format/yapf
	@:

test/pytest: $(MODULE)
	pytest --cov beamx
	coverage html
test: test/pytest
	@:

#!/usr/bin/env sh

MODULE=$(ls -d -C beamx *.py)
FILES_TO_IGNORE=
ISORT_SKIP_PARAM=

pylint ${MODULE} -j8 --ignore-patterns="$FILES_TO_IGNORE"

flake8 ${MODULE} --count \
  --select=E9,F821,F822,F823 \
  --show-source --statistics \
  --exclude="${FILES_TO_IGNORE}"

isort ${MODULE} \
  --check-only --order-by-type \
  --diff --recursive ${ISORT_SKIP_PARAM}

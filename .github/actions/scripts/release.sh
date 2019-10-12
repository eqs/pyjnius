#!/usr/bin/env bash
set -ex

if [[ "refs/tags/$(git tag | grep v | tail -n 1)" = $GITHUB_REF ]]; then
    python -m twine check dist/*
  if [[ $GITHUB_REF =~ -test$ ]]; then
    python -m twine upload -u kivybot --disable-progress-bar --repository-url https://test.pypi.org/legacy/ dist/*
  else
    python -m twine upload -u kivybot --disable-progress-bar dist/*
  fi
fi

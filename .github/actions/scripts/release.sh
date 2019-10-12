#!/usr/bin/env bash
set -ex

python -m twine check dist/*
if [[ $GITHUB_REF =~ -test$ ]]; then
    python -m twine upload -u kivybot --disable-progress-bar --repository-url https://test.pypi.org/legacy/ dist/*
else
    echo "would have uploaded :|"
    #python -m twine upload -u kivybot --disable-progress-bar dist/*
fi

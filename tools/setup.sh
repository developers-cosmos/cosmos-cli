#!/usr/bin/env bash

brew install bazelisk

# for linting
brew install clang-format
brew install buildifier
brew install pre-commit
curl -sS https://webi.sh/shfmt | sh
source "$HOME/.config/envman/PATH.env"
brew install shellcheck

pre-commit install
pre-commit run -a

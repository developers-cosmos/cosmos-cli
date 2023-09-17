#!/usr/bin/env bash

# TODO: Update this script for other OS & able to reproducible

brew install bazelisk

# sh <(curl -L https://nixos.org/nix/install)

# for linting
brew install clang-format
brew install buildifier
brew install pre-commit
curl -sS https://webi.sh/shfmt | sh
source "$HOME/.config/envman/PATH.env"
brew install shellcheck
brew install actionlint

pre-commit install
pre-commit run -a

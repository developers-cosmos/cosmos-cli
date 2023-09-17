#!/usr/bin/env bash

nix flake lock --update-input nixpkgs
nix flake update

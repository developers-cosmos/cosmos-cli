# cosmos-cli

[![Build and Test Cosmos CLI](https://github.com/developers-cosmos/cosmos-cli/actions/workflows/build.yaml/badge.svg)](https://github.com/developers-cosmos/cosmos-cli/actions/workflows/build.yaml)

Cosmos CLI is a versatile command-line tool developed by Developers-Cosmos, simplifying the installation, setup, and management of a diverse range of projects and applications offered by our organization, spanning various languages and domains. Streamline your development workflow and access our projects effortlessly with Cosmos CLI.

## Prerequisites

Before you can use this project, make sure you have the following software installed:

- **Nix Package Manager**: Nix is a powerful package manager that this project relies on for managing dependencies and development environments.
You can install Nix by following the instructions for your operating system:
  - [Install Nix](https://nixos.org/download)

# Demo [WIP]

Use the below commands to pull a very basic version of cosmos-cli.

```shell
nix develop github:developers-cosmos/cosmos-cli -c cosmos
```

The above command produces the following output.

```shell
[Cosmos CLI]: Hello from Developers Cosmos!
```

To enter into the flake environment run the below command:

```she
nix shell github:developers-cosmos/cosmos-cli
```

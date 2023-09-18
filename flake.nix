{
  description = "Cosmos CLI";

  inputs = {
    nixpkgs.url = "https://releases.nixos.org/nixos/23.05/nixos-23.05.3580.5d017a8822e0/nixexprs.tar.xz";
    flake-utils.url = "git+https://github.com/numtide/flake-utils?ref=main";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
        nativeBuildInputs = with pkgs;
        [
          bazel_6
          bazel-buildtools
        ];
        cosmos = pkgs.stdenv.mkDerivation {
          name = "cosmos";
          version = "0.0.1";
          src = self;
          nativeBuildInputs = nativeBuildInputs;
          buildPhase = ''
            bazel build //src:cosmos;
          '';

          installPhase = ''
            mkdir -p $out/bin;
            cp -r bazel-bin/src/cosmos $out/bin;
          '';
        };
      in rec
      {
        defaultPackage = cosmos;

        devShells = {
          default = pkgs.mkShell {
            packages = nativeBuildInputs ++ [
              cosmos
            ];
          };
        };

        # default = pkgs.devshell.mkShell {
        #   imports = [ (pkgs.devshell.importTOML ./devshell.toml) ];
        # };

      });
}

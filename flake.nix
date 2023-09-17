{
  description = "Cosmos CLI";

  inputs = {
    nixpkgs.url = "https://releases.nixos.org/nixos/23.05/nixos-23.05.861.d3bb401dcfc/nixexprs.tar.xz";
    flake-utils.url = "git+https://github.com/numtide/flake-utils?ref=main";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachSystem ["x86_64-linux" "aarch64-linux" "aarch64-darwin"] (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in
      {
        # Define the derivation build phase
        derivation = pkgs.stdenv.mkDerivation {
          name = "cosmos";
          version = "0.0.1";
          src = self;
          buildPhase = ''
            bazelisk build //src:hello-world
          '';

          installPhase = ''
            mkdir -p $out/bin;
            cp -r bazel-bin/hello-world $out/bin;
          '';
        };

        devShells = {
          default = pkgs.mkShell {
            packages = [
              pkgs.bazel
              pkgs.bazelisk
            ];
          };

          # default = pkgs.devshell.mkShell {
          #   imports = [ (pkgs.devshell.importTOML ./devshell.toml) ];
          # };
        };
      });
}

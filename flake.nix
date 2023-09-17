{
  description = "Cosmos CLI";

  inputs = {
    nixpkgs.url = "https://releases.nixos.org/nixos/23.05/nixos-23.05.861.d3bb401dcfc/nixexprs.tar.xz";
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
            bazel build //src:hello-world
          '';

          installPhase = ''
            mkdir -p $out/bin;
            cp -r bazel-bin/src/hello-world $out/bin;
          '';
        };
      in rec
      {
        #defaultPackage = cosmos;
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = nativeBuildInputs ++ [
            cosmos
          ];
        };

        # default = pkgs.devshell.mkShell {
        #   imports = [ (pkgs.devshell.importTOML ./devshell.toml) ];
        # };

      });
}

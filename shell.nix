let
  flake = builtins.getFlake "git+file://${toString ./.}";
  currentSystem = builtins.currentSystem;
in
  flake.devShells.${currentSystem}.default

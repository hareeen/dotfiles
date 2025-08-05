{flake, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    ./common/from-env-or-root.nix
    self.homeModules.default
    self.homeModules.default-linux
  ];
}

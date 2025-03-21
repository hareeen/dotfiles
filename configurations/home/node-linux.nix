{flake, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    ./common/root.nix
    self.homeModules.default
    self.homeModules.default-linux
    self.homeModules.node
    self.homeModules.node-linux
  ];
}

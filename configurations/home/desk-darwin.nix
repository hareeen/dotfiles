{flake, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    ./common/me.nix
    self.homeModules.default
    self.homeModules.default-darwin
    self.homeModules.desk
    self.homeModules.desk-darwin
  ];
}

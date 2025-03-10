{flake, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.homeModules.dev
    self.homeModules.app
    self.homeModules.app-darwin-only
  ];
}

# Reusable modules exported from the flake and imported by configurations/.
{
  flake = {
    darwinModules.default = ../darwin;

    nixosModules = {
      default = ../nixos;
      minimal = ../nixos/minimal.nix;
    };

    homeModules = {
      default = ../home;
      default-darwin = ../home/default-darwin.nix;
      default-linux = ../home/default-linux.nix;
      desk = ../home/desk.nix;
      desk-darwin = ../home/desk-darwin.nix;
      desk-linux = ../home/desk-linux.nix;
      node = ../home/node.nix;
      node-darwin = ../home/node-darwin.nix;
      node-linux = ../home/node-linux.nix;
    };
  };
}

# System and home configurations, one explicit entry per host.
{
  self,
  inputs,
  config,
  lib,
  ...
}:
let
  specialArgs = {
    flake = {
      inherit self inputs config;
    };
  };

  # Shared by every home-manager evaluation, standalone or embedded in a system.
  homeCommon = { pkgs, ... }: {
    home.sessionPath = [
      "$HOME/.local/bin"
    ]
    # nix-darwin and home-manager binaries are not on the default macOS PATH.
    ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
      "/etc/profiles/per-user/$USER/bin"
      "/nix/var/nix/profiles/system/sw/bin"
      "/usr/local/bin"
    ];
  };

  withHomeManager = hmModule: {
    imports = [ hmModule ];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = specialArgs;
      sharedModules = [ homeCommon ];
    };
  };

  mkDarwin =
    module:
    inputs.nix-darwin.lib.darwinSystem {
      inherit specialArgs;
      modules = [
        (withHomeManager inputs.home-manager.darwinModules.home-manager)
        module
      ];
    };

  mkNixos =
    module:
    inputs.nixpkgs.lib.nixosSystem {
      inherit specialArgs;
      modules = [
        (withHomeManager inputs.home-manager.nixosModules.home-manager)
        module
      ];
    };

  mkHome =
    pkgs: module:
    inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = specialArgs;
      modules = [
        homeCommon
        module
      ];
    };
in
{
  flake = {
    darwinConfigurations.book = mkDarwin ../../configurations/darwin/book.nix;
    nixosConfigurations.shelf = mkNixos ../../configurations/nixos/shelf.nix;
  };

  perSystem = { pkgs, ... }: {
    # Home configurations are platform-generic, so they live under the
    # per-system attribute set that home-manager and nh both resolve.
    legacyPackages.homeConfigurations = {
      desk-darwin = mkHome pkgs ../../configurations/home/desk-darwin.nix;
      desk-linux = mkHome pkgs ../../configurations/home/desk-linux.nix;
      kit-darwin = mkHome pkgs ../../configurations/home/kit-darwin.nix;
      kit-linux = mkHome pkgs ../../configurations/home/kit-linux.nix;
      node-darwin = mkHome pkgs ../../configurations/home/node-darwin.nix;
      node-linux = mkHome pkgs ../../configurations/home/node-linux.nix;
    };
  };
}

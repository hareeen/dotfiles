{
  flake,
  pkgs,
  lib,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  nixpkgs = {
    config = {
      allowBroken = true;
      allowUnsupportedSystem = true;
      allowUnfree = true;
    };
    overlays =
      lib.attrValues self.overlays
      ++ [
        (final: prev: {
          direnv = prev.direnv.overrideAttrs (_: {
            doCheck = false;
            doInstallCheck = false;
          });
          gleam = prev.gleam.overrideAttrs (_: {
            doCheck = false;
          });
        })
      ];
  };

  nix = {
    enable = true;
    package = pkgs.lixPackageSets.stable.lix;

    nixPath = ["nixpkgs=${flake.inputs.nixpkgs}"];
    registry.nixpkgs.flake = flake.inputs.nixpkgs;

    gc =
      {
        automatic = true;
        options = "--delete-older-than 30d";
      }
      // (
        if pkgs.stdenv.isLinux
        then {dates = "weekly";}
        else {
          interval = {
            Weekday = 0;
            Hour = 0;
            Minute = 0;
          };
        }
      );

    optimise.automatic = true;

    settings = {
      max-jobs = "auto";
      experimental-features = "nix-command flakes";

      extra-platforms = lib.mkIf pkgs.stdenv.isDarwin "aarch64-darwin x86_64-darwin";

      trusted-users = [
        "root"
        (
          if pkgs.stdenv.isDarwin
          then flake.config.me.username
          else "@wheel"
        )
      ];

      substituters = [
        "https://cache.nixos.org"
        "https://cache.lix.systems"
        "https://nix-community.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };
}

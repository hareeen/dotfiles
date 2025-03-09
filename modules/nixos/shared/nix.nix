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
    overlays = lib.attrValues self.overlays;
  };

  nix = {
    enable = true;

    package = pkgs.nixVersions.latest;

    nixPath = ["nixpkgs=${flake.inputs.nixpkgs}"];
    registry.nixpkgs.flake = flake.inputs.nixpkgs;

    settings = {
      max-jobs = "auto";
      experimental-features = "nix-command flakes";

      extra-platforms = lib.mkIf pkgs.stdenv.isDarwin "aarch64-darwin x86_64-darwin";

      flake-registry = builtins.toFile "empty-flake-registry.json" ''{"flakes":[],"version":2}'';
      trusted-users = [
        "root"
        (
          if pkgs.stdenv.isDarwin
          then flake.config.me.username
          else "@wheel"
        )
      ];
    };
  };
}

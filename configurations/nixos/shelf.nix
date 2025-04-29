# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{flake, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (flake.config) me;
in {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configurations/shelf.nix

    self.nixosModules.default
  ];

  home-manager = {
    users."${me.username}" = {
      imports = [(self + /configurations/home/desk-linux.nix)];
    };
  };

  networking.hostName = "shelf"; # Define your hostname.

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable tailscale
  services.tailscale.enable = true;
}

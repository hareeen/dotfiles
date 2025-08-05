{
  flake,
  lib,
  pkgs,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (flake.config) me;
in {
  imports = [
    self.nixosModules.common

    ./all/audio.nix
    ./all/font.nix
    ./all/gnome.nix
    ./all/graphics.nix
    ./all/grub.nix
    ./all/i18n.nix
  ];

  users.users = lib.optionalAttrs (me.username != "root") {
    ${me.username} = {
      name = me.username;
      home = "/home/${me.username}";
      shell = pkgs.zsh;
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
    };
  };

  security = {
    sudo.execWheelOnly = true;
    sudo.wheelNeedsPassword = false;
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  system.stateVersion = "24.11";
}

{ flake
, pkgs
, ...
}:
let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (flake.config) me;
in
{
  imports = [
    self.nixosModules.common
  ];

  home-manager.sharedModules = [
    self.homeModules.default
    self.homeModules.linux-only
  ];

  users.${me.username} = {
    name = me.username;
    home = "/home/${me.username}";
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  security = {
    sudo.execWheelOnly = true;
    sudo.wheelNeedsPassword = false;
  };

  system.stateVersion = 24.11;
}

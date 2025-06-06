{
  flake,
  pkgs,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.common
  ];

  users.users.root = {
    name = "root";
    home = "/root";
    uid = 0;
    shell = pkgs.zsh;
    isSystemUser = true;
    extraGroups = ["wheel"];
  };

  system.stateVersion = "24.11";
}

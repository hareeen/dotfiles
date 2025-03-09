{
  flake,
  pkgs,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (flake.config) me;
in {
  imports = [
    self.nixosModules.common
  ];

  home-manager.sharedModules = [
    self.homeModules.default
    self.homeModules.darwin-only
  ];

  users.knownUsers = [me.username];
  users.users.${me.username} = {
    uid = 501;
    name = me.username;
    home = "/Users/${me.username}";
    shell = pkgs.fish;
  };

  system.stateVersion = 6;
}

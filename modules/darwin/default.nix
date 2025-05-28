{flake, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (flake.config) me;
in {
  imports = [
    self.nixosModules.common
  ];

  system.primaryUser = me.username;

  users.knownUsers = [me.username];
  users.users.${me.username} = {
    uid = 501;
    name = me.username;
    home = "/Users/${me.username}";
    shell = "/bin/zsh";
  };

  system.stateVersion = 6;
}

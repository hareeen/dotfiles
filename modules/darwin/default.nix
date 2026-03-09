{
  flake,
  pkgs,
  ...
}: let
  inherit (flake.config) me;
  inherit (flake.config) opt;
in {
  imports = [
    ../common
  ];

  system.primaryUser = me.username;

  users.knownUsers = [me.username];
  users.users.${me.username} = {
    uid = 501;
    name = me.username;
    home = "/Users/${me.username}";
    shell =
      if opt.enableFish
      then pkgs.fish
      else pkgs.zsh;
  };

  system.stateVersion = 6;
}

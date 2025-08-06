{
  flake,
  pkgs,
  lib,
  ...
}: let
  inherit (flake.config) me;
in {
  home.username = me.username;

  home.homeDirectory =
    if me.username == "root"
    then lib.mkForce /root
    else if pkgs.stdenv.isDarwin
    then lib.mkDefault /Users/${me.username}
    else lib.mkDefault /home/${me.username};
}

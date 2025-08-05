{
  flake,
  pkgs,
  lib,
  ...
}: let
  inherit (flake.config) me;
in {
  home.username = me.username;
  home.homeDirectory = lib.mkDefault (
    if me.username == "root"
    then /root
    else if pkgs.stdenv.isDarwin
    then /Users/${me.username}
    else /home/${me.username}
  );
}

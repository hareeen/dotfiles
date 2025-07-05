{
  flake,
  pkgs,
  ...
}: let
  inherit (flake.config) me;
in {
  imports = [
    ./all/tex.nix
  ];

  home.packages = with pkgs; [
    # bitwarden-cli
    discordo
  ];

  programs.git = {
    userName = me.fullname;
    userEmail = me.email;
  };
}

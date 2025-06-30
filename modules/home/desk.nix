{pkgs, ...}: {
  home.packages = with pkgs; [
    # bitwarden-cli
    discordo
  ];

  imports = [
    ./all/tex.nix
  ];
}

{pkgs, ...}: {
  imports = [
    ./all/ghostty.nix
  ];

  home.packages = with pkgs; [
    librewolf-bin
    bitwarden-desktop
    ungoogled-chromium
  ];
}

{pkgs, ...}: {
  imports = [
    ./all/ghostty.nix
    ./all/zed.nix
    ./all/vscode.nix
  ];

  home.packages = with pkgs; [
    librewolf-bin
    bitwarden-desktop
    ungoogled-chromium
    legcord
  ];
}

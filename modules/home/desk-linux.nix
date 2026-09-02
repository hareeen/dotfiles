{ pkgs, ... }: {
  imports = [
    ./all/ghostty.nix
    ./all/zed.nix
    ./all/vscode.nix
  ];

  home.packages = with pkgs; [
    legcord
  ];
}

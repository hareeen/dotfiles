{
  imports = [
    ./all/nix.nix
  ];

  home-manager.backupFileExtension = "before-nix";

  # programs.bash.enable = true;
  programs.zsh.enable = true;
  programs.fish.enable = true;
}

{
  home.stateVersion = "24.11";

  imports = [
    ./all/fish.nix
    ./all/terminal.nix

    ./all/git.nix
    # ./all/mise.nix
    ./all/direnv.nix

    # ./all/ghostty.nix

    ./all/nix.nix
  ];
}

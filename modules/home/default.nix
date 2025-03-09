{
  home.stateVersion = "24.11";

  imports = [
    ./all/fish
    ./all/terminal

    ./all/vim.nix

    ./all/utils.nix

    ./all/git.nix
    ./all/direnv.nix

    # ./all/ghostty.nix

    ./all/nix.nix
  ];
}

{
  home.stateVersion = "24.11";

  imports = [
    ./all/fish
    ./all/terminal

    ./all/dev.nix

    ./all/vim.nix

    ./all/utils.nix

    ./all/git.nix
    ./all/direnv.nix
  ];
}

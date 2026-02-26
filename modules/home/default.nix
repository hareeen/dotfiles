{flake, ...}: let
  inherit (flake.config) opt;
in {
  home.stateVersion = "24.11";

  imports =
    [
      ./all/shell

      ./all/helix.nix

      ./all/git.nix
      ./all/direnv.nix
    ]
    ++ (
      if opt.enableVim
      then [./all/vim.nix]
      else []
    )
    ++ (
      if opt.enableUtils
      then [./all/utils.nix]
      else []
    )
    ++ (
      if opt.enableDevelopmentKit
      then [./all/dev.nix]
      else []
    )
    ++ (
      if opt.enableFish
      then [./all/fish.nix]
      else [./all/zsh.nix]
    );
}

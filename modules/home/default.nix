{flake, ...}: let
  inherit (flake.config) opt;
in {
  home.stateVersion = "24.11";

  imports =
    [
      ./all/fish
      ./all/terminal

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
    );
}

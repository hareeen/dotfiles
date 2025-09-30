{
  flake,
  lib,
  ...
}: let
  inherit (flake.config) me;
  inherit (flake.config) opt;
in {
  programs = {
    git = {
      enable = true;

      userName = lib.mkIf (me ? fullname) me.fullname;
      userEmail = lib.mkIf (me ? email) me.email;

      ignores = [
        ".DS_Store"
        "*.swp"
        "*~"
      ];

      lfs.enable = true;

      extraConfig = {
        init.defaultBranch = "main";
        core.editor =
          if opt.enableVim
          then "nvim"
          else "hx";
        pull.rebase = "false";
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };
}

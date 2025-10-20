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

      settings = {
        name = lib.mkIf (me ? fullname) me.fullname;
        email = lib.mkIf (me ? email) me.email;
        init.defaultBranch = "main";
        core.editor =
          if opt.enableVim
          then "nvim"
          else "hx";
        pull.rebase = "false";
      };

      ignores = [
        ".DS_Store"
        "*.swp"
        "*~"
      ];

      lfs.enable = true;
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };
}

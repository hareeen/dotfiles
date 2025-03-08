{ flake, ... }:

let
  inherit (flake.config) me;
in
{
  programs = {
    git = {
      enable = true;

      userName = me.fullname;
      userEmail = me.email;

      ignores = [
        ".DS_Store"
        "*.swp"
        "*~"
      ];

      lfs.enable = true;

      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "nvim";
        pull.rebase = "false";
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };
}

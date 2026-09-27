{
  flake,
  lib,
  ...
}:
let
  inherit (flake.config) me;
  inherit (flake.config) opt;
in
{
  programs = {
    git = {
      enable = true;

      signing.format = null;

      settings = {
        user = {
          name = lib.mkIf (me ? fullname) me.fullname;
          email = lib.mkIf (me ? email) me.email;
        };
        init.defaultBranch = "main";
        core.editor = if opt.enableVim then "nvim" else "hx";
        pull.rebase = "false";
        push.autoSetupRemote = true;
        fetch.prune = true;
        rebase.autoStash = true;
        rerere.enabled = true;
        merge.conflictStyle = "zdiff3";
        diff.algorithm = "histogram";
      };

      ignores = [
        ".DS_Store"
        "*.swp"
        "*~"
      ];

      lfs.enable = true;
    };

    delta = {
      enable = true;
      enableGitIntegration = true;
      options.navigate = true;
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };
}

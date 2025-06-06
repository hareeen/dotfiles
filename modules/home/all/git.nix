{
  programs = {
    git = {
      enable = true;

      # userName = me.fullname;
      # userEmail = me.email;

      ignores = [
        ".DS_Store"
        "*.swp"
        "*~"
      ];

      lfs.enable = true;

      extraConfig = {
        init.defaultBranch = "main";
        core.editor = "hx";
        pull.rebase = "false";
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = true;
    };
  };
}

{
  programs = {
    fzf.enable = true;
    eza.enable = true;

    zoxide = {
      enable = true;

      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
    };

    starship = {
      enable = true;

      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;

      settings = builtins.fromTOML (builtins.readFile ./starship.toml);
    };
  };
}

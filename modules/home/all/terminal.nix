{
  programs = {
    fzf.enable = true;
    eza.enable = true;
    zoxide.enable = true;
    mcfly.enable = true;
    ripgrep.enable = true;
    bat.enable = true;
    fd.enable = true;
    fastfetch.enable = true;
    starship = {
      enable = true;

      enableBashIntegration = true;
      enableZshIntegration = true;
      enableFishIntegration = true;

      settings = builtins.fromTOML (builtins.readFile ./resources/nerd-font-symbols.toml);
    };
  };
}

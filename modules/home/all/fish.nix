{
  home.file = {
    fishAbbrs = {
      enable = true;
      source = ./resources/abbrs.fish;
      target = ".config/fish/conf.d/abbrs.fish";
    };
    fishColors = {
      enable = true;
      source = ./resources/colors.fish;
      target = ".config/fish/conf.d/colors.fish";
    };
  };

  programs.fish = {
    enable = true;
    preferAbbrs = true;
  };
}

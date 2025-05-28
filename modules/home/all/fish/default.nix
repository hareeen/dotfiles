{
  home.file = {
    fishAbbrs = {
      enable = true;
      source = ./abbrs.fish;
      target = ".config/fish/conf.d/abbrs.fish";
    };
    fishColors = {
      enable = true;
      source = ./colors.fish;
      target = ".config/fish/conf.d/colors.fish";
    };
    zshrc = {
      enable = true;
      source = ./pipe.sh;
      target = ".zshrc";
    };
    bashrc = {
      enable = true;
      source = ./pipe.sh;
      target = ".bashrc";
    };
  };

  programs.fish = {
    enable = true;
    preferAbbrs = true;
  };
}

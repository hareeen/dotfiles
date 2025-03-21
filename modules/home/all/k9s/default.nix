{...}: {
  programs = {
    k9s = {
      enable = true;

      settings.k9s.ui = {
        enableMouse = true;
        logoless = true;
      };

      skins = {
        catppuccin-mocha-transparent = ./catppuccin-mocha-transparent.yaml;
      };
    };
  };
}

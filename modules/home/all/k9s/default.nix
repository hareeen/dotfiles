{
  programs = {
    k9s = {
      enable = true;

      settings.k9s.ui = {
        enableMouse = true;
        logoless = true;
        skin = "ansi";
      };

      skins = {
        ansi = ./ansi.yaml;
      };
    };
  };
}

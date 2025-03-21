{pkgs, ...}: {
  programs = {
    k9s = {
      enable = true;

      settings.ui = {
        enableMouse = true;
        logoless = true;
        skin = "catppuccin-mocha-transparent";
      };

      skins = {
        catppuccin-mocha-transparent = ./catppuccin-mocha-transparent.yaml;
      };
    };
  };

  home.packages = with pkgs; [
    kubernetes-helm
    kustomize
  ];
}

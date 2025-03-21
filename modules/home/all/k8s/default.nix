{pkgs, ...}: {
  programs = {
    k9s = {
      enable = true;

      settings.ui = {
        enableMouse = true;
        logless = true;
        skin = "catppuccin-mocha-transparent";
      };

      skins = {
        catppuccin-mocha-transparent = ./catppuccin-mocha-transparent.yaml;
      };
    };
  };

  home.packages = with pkgs; [
    k3s
    kubernetes-helm
    kustomize
  ];
}

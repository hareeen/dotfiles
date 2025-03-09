{pkgs, ...}: {
  home.packages = with pkgs; [
    xh
    hexyl
    ouch
    wget
    dust
  ];

  programs = {
    mcfly.enable = true;
    ripgrep.enable = true;
    bat.enable = true;
    fd.enable = true;
    fastfetch.enable = true;
    btop.enable = true;
  };
}

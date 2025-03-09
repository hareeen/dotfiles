{ pkgs, ... }:
{
  home.packages = with pkgs; [
    xh
    hexyl
    ouch
    wget
    dust
    ffmpeg_6-full
  ];

  programs = {
    mcfly.enable = true;
    ripgrep.enable = true;
    bat.enable = true;
    fd.enable = true;
    fastfetch.enable = true;
  };
}

{pkgs, ...}: {
  home.packages = with pkgs; [
    ffmpeg_6-full
  ];
}

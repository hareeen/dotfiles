{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.blex-mono
    pretendard
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];
}

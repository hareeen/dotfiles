{pkgs, ...}: {
  home.packages = with pkgs; [
    iina
    librewolf
    raycast
    keka
  ];
}

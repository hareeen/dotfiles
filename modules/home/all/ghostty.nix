{
  flake,
  pkgs,
  ...
}:
let
  inherit (flake.config) opt;
in
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;

    enableZshIntegration = !opt.enableFish;
    enableFishIntegration = opt.enableFish;

    settings = {
      theme = "Vesper";
      font-family = [
        "BlexMono Nerd Font"
        "Pretendard"
      ];
      font-size = 11;
      background-opacity = 0.9;
      window-padding-x = 8;
      cursor-style = "bar";
    };
  };
}

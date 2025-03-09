{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;

    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;

    settings = {
      theme = "mellow";
      font-family = [
        "FiraCode Nerd Font"
        "Pretendard"
      ];
      font-size = 16;
      background-opacity = 0.9;
      window-padding-x = 8;
      cursor-style = "bar";
      adjust-cell-width = "-8%";
      adjust-cell-height = "4%";
      macos-titlebar-style = "tabs";
    };
  };
}

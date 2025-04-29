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
        "BlexMono Nerd Font"
        "Pretendard"
      ];
      font-size = 11;
      background-opacity = 0.9;
      window-padding-x = 8;
      cursor-style = "bar";
      macos-titlebar-style = "tabs";
      macos-option-as-alt = "left";
    };
  };
}

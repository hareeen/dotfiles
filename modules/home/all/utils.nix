{pkgs, ...}: {
  home.packages = with pkgs; [
    xh
    hexyl
    ouch
    wget
    dust
    hyperfine
    convmv
    cloc
    bunbun
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

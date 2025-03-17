{pkgs, ...}: {
  home.packages = with pkgs; [
    coreutils-full

    xh
    hexyl
    ouch
    wget
    evans
    dust
    hyperfine
    convmv
    cloc
    bunbun
    socat
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

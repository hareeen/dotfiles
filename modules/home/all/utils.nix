{pkgs, ...}: {
  home.packages = with pkgs; [
    coreutils-full

    xh
    hexyl
    ouch
    wget
    curl
    evans
    dust
    hyperfine
    convmv
    cloc
    bunbun
    socat
    usql

    ffmpeg_6-full
    pandoc
    bitwarden-cli
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

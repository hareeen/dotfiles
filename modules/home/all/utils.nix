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
    killall
    usql
    tmux
    just

    shadowsocks-rust
    proxychains-ng

    typst
    tinymist

    ffmpeg_6-full
    pandoc
    rclone
    teleport

    iamb
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

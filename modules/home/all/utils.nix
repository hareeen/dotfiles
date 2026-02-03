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
    jq
    zellij
    less

    shadowsocks-rust
    proxychains-ng

    typst
    tinymist

    ffmpeg-full
    pandoc
    rclone
    teleport

    wasmtime
  ];

  programs = {
    mcfly.enable = true;
    ripgrep.enable = true;
    bat.enable = true;
    fd.enable = true;
    fastfetch.enable = true;
    btop.enable = true;
    awscli.enable = true;
  };
}

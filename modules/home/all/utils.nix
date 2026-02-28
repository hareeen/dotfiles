{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs;
    [
      # Core system utilities
      coreutils-full
      inetutils
      procps
      file
      tree
      lsof
    ]
    ++ lib.optionals pkgs.stdenv.isLinux [
      psmisc
    ]
    ++ (with pkgs; [
      # GNU tools
      gnugrep
      gnused
      gawk
      gnutar
      gnupatch
      diffutils
      findutils

      # Compression
      gzip
      bzip2
      xz
      ouch
      unzip
      zip

      # Network
      curl
      wget
      xh
      socat
      doggo
      shadowsocks-rust
      proxychains-ng

      # Terminal & shell
      less
      tmux
      zellij
      just
      jq

      # File & disk
      dust
      hexyl
      rsync
      rclone
      convmv

      # Dev tools
      entr
      hyperfine
      tokei
      evans
      usql
      bunbun
      wasmtime

      # Media & docs
      ffmpeg-full
      pandoc
      typst
      tinymist

      # Infra
      teleport
    ]);

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

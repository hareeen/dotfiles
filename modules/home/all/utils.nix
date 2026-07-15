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
      bubblewrap
    ]
    ++ lib.optionals pkgs.stdenv.isDarwin [
      container
    ]
    ++ [
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
      cachix
      entr
      hyperfine
      tokei
      evans
      bunbun
      wasmtime
      usql

      # Media & docs
      pandoc
      typst
      tinymist

      # Infra
      teleport
      google-cloud-sdk
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

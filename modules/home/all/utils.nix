{
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./k9s
  ];

  home.packages =
    with pkgs;
    [
      # Core system utilities
      procps
      file
      tree
      lsof
    ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      psmisc
      gnused
      bubblewrap
      inetutils
      coreutils-full
    ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
      container
    ]
    ++ [
      # GNU tools
      gnugrep
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
      kubectl
      kubernetes-helm
      flux
      k3d
    ];

  programs = {
    ripgrep.enable = true;
    bat.enable = true;
    fd.enable = true;
    fastfetch.enable = true;
    btop.enable = true;
    awscli.enable = true;

    atuin = {
      enable = true;
      flags = [ "--disable-up-arrow" ];
      settings = {
        search_mode = "fuzzy";
        style = "compact";
        auto_sync = false;
      };
    };
  };
}

{
  flake,
  pkgs,
  lib,
  ...
}:
{
  imports = [
    ./k9s
    flake.inputs.nix-index-database.homeModules.nix-index
  ];

  home.packages =
    with pkgs;
    [
      # Core system utilities
      procps
    ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      file
      lsof
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
      shadowsocks-rust
      proxychains-ng

      # Terminal & shell
      less
      tmux
      zellij
      just
      jq

      # File & disk
      rsync
      rclone

      # Dev tools
      cachix
      grpcurl
      bunbun
      wasmtime

      # Media & docs
      pandoc
      typst
      tinymist

      # Infra
      teleport
      wrangler
      google-cloud-sdk
      kubectl
      kubernetes-helm
      flux
      k3d
    ];

  programs = {
    bat = {
      enable = true;
      config.theme = "ansi";
    };

    btop = {
      enable = true;
      settings = {
        color_theme = "TTY";
        theme_background = false;
      };
    };

    ripgrep.enable = true;
    fd.enable = true;
    fastfetch.enable = true;
    awscli.enable = true;

    nh.enable = true;

    nix-index.enable = true;
    nix-index-database.comma.enable = true;

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

{ pkgs, ... }: {
  home.file = {
    rustfmtToml = {
      enable = true;
      source = ./rustfmt.toml;
      # rustfmt resolves its user config through the `dirs` crate, which ignores
      # XDG on Darwin and looks under Application Support instead of ~/.config.
      target =
        if pkgs.stdenv.hostPlatform.isDarwin then
          "Library/Application Support/rustfmt/rustfmt.toml"
        else
          ".config/rustfmt/rustfmt.toml";
    };
  };

  home.packages = with pkgs; [
    (
      with fenix;
      combine [
        stable.cargo
        stable.clippy
        stable.rust-src
        stable.rustc
        complete.rustfmt
        targets.wasm32-unknown-unknown.stable.rust-std
      ]
    )

    rust-analyzer

    cargo-outdated
    cargo-edit

    cargo-audit
    cargo-deny

    cargo-nextest

    tokio-console
    cargo-bloat
    cargo-flamegraph
    sccache

    cargo-expand
    cargo-machete

    cargo-release
  ];
}

{pkgs, ...}: {
  home.file = {
    rustfmtToml = {
      enable = true;
      source = ./rustfmt.toml;
      target = ".config/rustfmt/rustfmt.toml";
    };
  };

  home.packages = with pkgs; [
    (with fenix;
      combine [
        stable.cargo
        stable.clippy
        stable.rust-src
        stable.rustc
        complete.rustfmt
        targets.wasm32-unknown-unknown.stable.rust-std
      ])

    rust-analyzer
  ];
}

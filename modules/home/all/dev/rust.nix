{pkgs, ...}: {
  home.file = {
    rustfmtToml = {
      enable = true;
      source = ./rustfmt.toml;
      target = ".config/rustfmt/rustfmt.toml";
    };
  };

  home.packages = with pkgs; [
    (fenix.stable.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
    ])
    (fenix.complete.withComponents [
      "rustfmt"
    ])
    rust-analyzer
  ];
}

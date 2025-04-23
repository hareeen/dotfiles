{pkgs, ...}: {
  home.packages = with pkgs; [
    (fenix.complete.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
      "rustfmt"
    ])
    rust-analyzer

    uv

    bun
    deno
    biome

    go
    gopls
    golangci-lint

    nil
    nixd
    alejandra

    supabase-cli
  ];
}

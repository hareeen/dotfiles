{pkgs, ...}: {
  home.packages = with pkgs; [
    (fenix.stable.withComponents [
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
    go

    supabase-cli
  ];
}

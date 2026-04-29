{pkgs, ...}: {
  imports = [
    ./dev/rust.nix
  ];

  home.packages = with pkgs; [
    uv
    ruff
    ty

    bun
    biome

    go
    gopls
    golangci-lint

    nil
    nixd
    alejandra

    julia-bin

    gleam
    erlang
    rebar3

    supabase-cli

    cmake
  ];
}

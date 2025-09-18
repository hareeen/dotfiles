{pkgs, ...}: {
  imports = [
    ./dev/rust.nix
  ];

  home.packages = with pkgs; [
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

    dotnet-sdk
  ];
}

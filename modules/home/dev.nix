{pkgs, ...}: {
  imports = [
    ./all/rust.nix
  ];

  home.packages = with pkgs; [
    uv
    bun
    deno
    go

    supabase-cli
  ];
}

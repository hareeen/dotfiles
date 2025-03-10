{pkgs, ...}: {
  imports = [
    ./all/rust.nix
  ];

  home.packages = with pkgs; [
    uv
    bun
    deno

    supabase-cli
  ];
}

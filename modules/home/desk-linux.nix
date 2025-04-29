{
  flake,
  pkgs,
  ...
}: let
  inherit (flake) inputs;
in {
  imports = [
    ./all/ghostty.nix
    ./all/zed.nix

    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    policies = {
      DisableAppUpdate = true;
      DisableTelemetry = true;
    };
  };

  home.packages = with pkgs; [
    librewolf-bin
    bitwarden-desktop
    ungoogled-chromium
    legcord
  ];
}

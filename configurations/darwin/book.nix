{flake, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (flake.config) me;
in {
  imports = [
    self.darwinModules.default
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "book";

  security.pam.services.sudo_local.touchIdAuth = true;
  # security.pam.enableSudoTouchIdAuth = true;

  system = {
    defaults = {
      finder = {
        AppleShowAllExtensions = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        FXEnableExtensionChangeWarning = false;
        _FXShowPosixPathInTitle = true;
      };
    };
  };

  home-manager = {
    users."${me.username}" = {
      imports = [(self + /configurations/home/desk-darwin.nix)];
    };
  };
}

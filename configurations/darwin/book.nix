{ flake, ... }:
let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (flake.config) me;
in
{
  imports = [
    self.darwinModules.default
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "book";

  security.pam.services.sudo_local.touchIdAuth = true;
  # security.pam.enableSudoTouchIdAuth = true;

  system = {
    # Gestures follow the per-host global key, which `system.defaults.trackpad` does not write.
    # extraActivation runs before userDefaults, whose Dock restart picks this up.
    activationScripts.extraActivation.text = ''
      launchctl asuser "$(id -u -- ${me.username})" sudo --user=${me.username} -- \
        defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerVertSwipeGesture -int 2
    '';

    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        InitialKeyRepeat = 30;
        KeyRepeat = 2;
        ApplePressAndHoldEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.05;
        autohide-time-modifier = 0.8;
        tilesize = 48;
        show-recents = false;
        mru-spaces = false;
        showAppExposeGestureEnabled = true;
        wvous-tl-corner = 2; # Mission Control
        wvous-tr-corner = 12; # Notification Center
      };

      trackpad = {
        TrackpadThreeFingerVertSwipeGesture = 2;
      };

      finder = {
        AppleShowAllExtensions = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv";
        FXDefaultSearchScope = "SCcf";
        _FXShowPosixPathInTitle = true;
      };

      WindowManager = {
        EnableTilingByEdgeDrag = false;
        EnableTopTilingByEdgeDrag = false;
      };

      menuExtraClock = {
        ShowDate = 2;
        ShowAMPM = false;
      };

      CustomUserPreferences."com.apple.desktopservices".DSDontWriteNetworkStores = true;
    };
  };

  home-manager = {
    users."${me.username}" = {
      imports = [ (self + /configurations/home/desk-darwin.nix) ];
    };
  };
}

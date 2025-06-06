{pkgs, ...}: {
  # Set your time zone.
  time.timeZone = "Asia/Seoul";

  environment.systemPackages = with pkgs; [
    ibus
  ];

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  i18n.inputMethod = {
    enable = true;
    enabled = null;
    type = "ibus";
    ibus.engines = with pkgs.ibus-engines; [
      hangul
    ];
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "kr";
    variant = "kr104";
  };
}

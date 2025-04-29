{
  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
      useOSProber = true;
      default = "saved";
    };
    efi.canTouchEfiVariables = true;
  };
}

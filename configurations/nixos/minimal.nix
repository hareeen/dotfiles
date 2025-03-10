{flake, ...}: let
  inherit (flake) inputs;
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.minimal
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [22];
  };

  home-manager = {
    users.root = {
      imports = [(self + /configurations/home/common/root.nix)];
    };
  };
}

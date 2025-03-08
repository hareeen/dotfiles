{ flake
, ...
}:
let
  inherit (flake) inputs;
  inherit (inputs) self;
in
{
  imports = [
    self.nixosModules.common
  ];

  system.stateVersion = 24.11;
}

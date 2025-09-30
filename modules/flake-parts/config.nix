{lib, ...}: let
  userSubmodule = lib.types.submodule {
    options = {
      username = lib.mkOption {
        type = lib.types.str;
      };
      fullname = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
      email = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
      };
    };
  };
  buildOptionSubmodule = lib.types.submodule {
    options = {
      enableVim = lib.mkOption {
        type = lib.types.bool;
      };
      enableUtils = lib.mkOption {
        type = lib.types.bool;
      };
      enableDevelopmentKit = lib.mkOption {
        type = lib.types.bool;
      };
    };
  };
in {
  imports = [
    ../../config.nix
  ];
  options = {
    me = lib.mkOption {
      type = userSubmodule;
    };
    opt = lib.mkOption {
      type = buildOptionSubmodule;
    };
  };
}

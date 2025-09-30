{lib, ...}: let
  userSubmodule = lib.types.submodule {
    options = {
      username = lib.mkOption {
        type = lib.types.str;
        description = "Your system username.";
      };
      fullname = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "Your full name. Intended for git config. If not set, git will not be configured with a user name.";
      };
      email = lib.mkOption {
        type = lib.types.nullOr lib.types.str;
        default = null;
        description = "Your email address. Intended for git config. If not set, git will not be configured with an email.";
      };
    };
  };
  buildOptionSubmodule = lib.types.submodule {
    options = {
      enableVim = lib.mkOption {
        type = lib.types.bool;
        description = "If true, enables the installation of neovim and related plugins with nixvim.";
      };
      enableUtils = lib.mkOption {
        type = lib.types.bool;
        description = "If true, enables various utility programs and scripts.";
      };
      enableDevelopmentKit = lib.mkOption {
        type = lib.types.bool;
        description = "If true, enables the development kit including programming languages and tools.";
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

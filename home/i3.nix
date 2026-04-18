{ config, pkgs, ... }:

{
  xsession.windowManager.i3 = {
    enable = true;
    config = null; # This disables the HM-generated config
    extraConfig = builtins.readFile ./i3/config;
  };
}

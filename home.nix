{ config, pkgs, ... }:

{
  home.username = "david";
  home.homeDirectory = "/home/david";
  home.stateVersion = "25.05";
  programs.git.enable = true;
  programs.fish = {
    enable = true;
    #profileExtra = ''
    #  if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    #    exec uwsm start -S hyprland-uwsm.desktop
    #  fi
    #'';
  };
}


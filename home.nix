{ config, pkgs, ... }:

{
  home.username = "david";
  home.homeDirectory = "/home/david";
  home.stateVersion = "25.05";
  programs.git = {
    enable = true;
    userEmail = "aquairain@gmail.com";
    userName = "David Zhang";
  };
  programs.fish = {
    enable = true;
  };
}


{ config, pkgs, ... }:
let
  hyprConfigPath = "${config.home.homeDirectory}/Project/nixos-conf/home/hypr";
  footConfigPath = "${config.home.homeDirectory}/Project/nixos-conf/home/foot";
  niriConfigPath = "${config.home.homeDirectory}/Project/nixos-conf/home/niri/config.kdl";
in
{
  home.username = "david";
  home.homeDirectory = "/home/david";
  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    nixfmt-rfc-style
    ripgrep
    just
    mc
    bat
    unzip
    sparkle
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    swayimg
    gimp3
    firefox
    nwg-displays
    bilibili
    freetube
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    systemd.enable = false;
  };
  xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink hyprConfigPath;

  xdg.configFile."niri/config.kdl".source = config.lib.file.mkOutOfStoreSymlink niriConfigPath;

  xdg.portal.config = {
    common = {
      default = [
        "gtk"
      ];
    };
    pantheon = {
      default = [
        "pantheon"
        "gtk"
      ];
      "org.freedesktop.impl.portal.Secret" = [
        "gnome-keyring"
      ];
    };
    x-cinnamon = {
      default = [
        "xapp"
        "gtk"
      ];
    };
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
    settings = {
      add_newline = false;
    };
  };

  programs.carapace = {
    enable = true;
    enableBashIntegration = true;
    enableNushellIntegration = true;
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  programs.nushell = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userEmail = "aquairain@gmail.com";
    userName = "David Zhang";
  };

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk;
    extraConfig = builtins.readFile ./home/emacs/init.el;
    extraPackages = epkgs: [
      epkgs.which-key
      epkgs.nix-mode
    ];
  };

  programs.foot = {
    enable = true;
    server.enable = true;
  };
  xdg.configFile."foot".source = config.lib.file.mkOutOfStoreSymlink footConfigPath;

  programs.qutebrowser = {
    enable = true;
    extraConfig = builtins.readFile ./home/qutebrowser/config.py;
  };

  programs.mpv = {
    enable = true;

    package = (
      pkgs.mpv-unwrapped.wrapper {
        mpv = pkgs.mpv-unwrapped.override {
          waylandSupport = true;
          ffmpeg = pkgs.ffmpeg-full;
        };
      }
    );

    config = {
      profile = "high-quality";
      ytdl-format = "bestvideo+bestaudio";
      cache-default = 4000000;
    };
  };

}

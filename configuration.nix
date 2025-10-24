# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Cache Mirror
  nix.settings.substituters = lib.mkForce [
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "zh_CN.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-fluent
      fcitx5-rime
    ];
  };

  security.polkit.enable = true;
  hardware.graphics.enable = true;

#  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  users.users.david = {
    isNormalUser = true;
    description = "david";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.niri = {
    enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wget
    tuigreet
    foot
    nushell
    hyprpolkitagent
    wl-clipboard
    cliphist
    xwayland-satellite
  ];

  # fonts
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  system.stateVersion = "25.05"; # Did you read the comment?
}

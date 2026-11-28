
{ config, lib, pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
    ];
  };

  programs.clash-verge = {
    enable = true;
    serviceMode = true;
    tunMode = true;
    autoStart = true;
  };

  programs.gpu-screen-recorder.enable = true;
  programs.firefox.enable = true;

  programs.pay-respects = {
    enable = true;
    alias = "fcm";
  };

  programs.nix-ld = {
    enable = true;
  };

  programs.appimage = {
    enable = true;
    binfmt = true;

    package = pkgs.appimage-run.override {
      extraPkgs = pkgs: with pkgs; [
        libepoxy
        libGL
        libxkbcommon
        vulkan-loader
      ];
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  programs.niri = {
    enable = true;
  };

  programs.hyprland = {
    enable = true;
  };

  programs.nh = {
    enable = true;
    flake="/home/shorin/nixos/";
  };

  programs.zsh = {
    enable = true;
  };
  
}

